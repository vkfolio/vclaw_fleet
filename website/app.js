/* VClaw landing — motion: a hero word reveal + scroll reveals. anime.js v3. Dark only. */
(function () {
  "use strict";
  var reduce = window.matchMedia && matchMedia("(prefers-reduced-motion: reduce)").matches;
  var hasAnime = typeof anime !== "undefined";

  /* ---------- hero: word stagger ---------- */
  if (hasAnime && !reduce) {
    anime({ targets: ".heroword", translateY: [26, 0], opacity: [0, 1],
      delay: anime.stagger(70, { start: 120 }), duration: 720, easing: "easeOutExpo" });
  }

  /* ---------- hero terminal: type the install ---------- */
  (function typer() {
    var el = document.getElementById("termtype");
    if (!el) return;
    var lines = [
      { t: "# macOS / Linux", c: "c-dim" },
      { t: "curl -fsSL https://get.vclaw.ai/install.sh | sh", c: "c-in" },
      { t: "", c: "" },
      { t: "✓ node installed · admin at http://192.168.0.x:18789/admin", c: "c-dim" },
      { t: "✓ online · 32 cores · waiting for the first command", c: "c-dim" }
    ];
    if (reduce || !hasAnime) {
      el.innerHTML = lines.map(function (l) {
        return '<span class="' + l.c + '">' + l.t + "</span>";
      }).join("\n");
      return;
    }
    var li = 0;
    (function nextLine() {
      if (li >= lines.length) {
        var cur = document.createElement("span");
        cur.className = "cursor"; cur.textContent = "█";
        el.appendChild(cur);
        anime({ targets: cur, opacity: [1, 0], direction: "alternate", loop: true, duration: 600, easing: "steps(1)" });
        return;
      }
      var l = lines[li], span = document.createElement("span");
      if (l.c) span.className = l.c;
      el.appendChild(span); el.appendChild(document.createTextNode("\n"));
      if (l.t === "") { li++; setTimeout(nextLine, 140); return; }
      var ci = 0;
      (function ch() {
        span.textContent = l.t.slice(0, ++ci);
        if (ci < l.t.length) setTimeout(ch, l.c === "c-in" ? 26 : 9);
        else { li++; setTimeout(nextLine, 340); }
      })();
    })();
  })();

  /* ---------- scroll reveals ---------- */
  var io = new IntersectionObserver(function (entries) {
    entries.forEach(function (e) {
      if (e.isIntersecting) { e.target.classList.add("in"); io.unobserve(e.target); }
    });
  }, { threshold: 0.14, rootMargin: "0px 0px -8% 0px" });
  document.querySelectorAll(".reveal").forEach(function (el) { io.observe(el); });

  /* ---------- video placeholder feedback ---------- */
  var demo = document.getElementById("demo");
  if (demo) demo.addEventListener("click", function () {
    if (hasAnime && !reduce) anime({ targets: ".play", scale: [1, 0.88, 1], duration: 320, easing: "easeOutBack" });
  });
})();
