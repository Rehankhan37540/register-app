<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="color-scheme" content="dark">
  <meta name="description" content="Rehan Khan, aspiring Cloud Engineer and Cloud Architect from Ghazipur, Uttar Pradesh. AWS, Linux, CI/CD and GitOps projects.">
  <title>Rehan Khan | Aspiring Cloud Engineer and Architect</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Sora:wght@500;700;800&family=Figtree:wght@400;500;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --ink: #070b14;
      --panel: #0d1424;
      --panel-2: #121b30;
      --line: #1f2b45;
      --text: #e6ecf8;
      --muted: #93a0ba;
      --cyan: #4cc9f0;
      --amber: #ffb547;
      --display: "Sora", "Segoe UI", system-ui, sans-serif;
      --body: "Figtree", "Segoe UI", system-ui, sans-serif;
    }
    * { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; color-scheme: dark; }
    body {
      font-family: var(--body);
      background: var(--ink);
      color: var(--text);
      line-height: 1.65;
      font-size: 17px;
      -webkit-font-smoothing: antialiased;
    }
    a { color: inherit; }
    a:focus-visible, button:focus-visible { outline: 2px solid var(--cyan); outline-offset: 3px; border-radius: 4px; }
    .wrap { max-width: 1040px; margin: 0 auto; padding: 0 24px; }

    /* top bar */
    nav { position: sticky; top: 0; z-index: 10; background: rgba(7, 11, 20, .88); backdrop-filter: blur(10px); border-bottom: 1px solid var(--line); }
    nav .wrap { display: flex; align-items: center; justify-content: space-between; height: 60px; }
    .brand { font-family: var(--display); font-weight: 700; text-decoration: none; letter-spacing: .01em; }
    .links { display: flex; gap: 26px; font-size: .95rem; color: var(--muted); }
    .links a { text-decoration: none; }
    .links a:hover { color: var(--text); }

    /* hero */
    .hero { padding: 84px 0 56px; }
    .hero .wrap { display: grid; grid-template-columns: 1.5fr 1fr; gap: 56px; align-items: center; }
    h1 { font-family: var(--display); font-weight: 800; font-size: clamp(2.6rem, 6vw, 4.4rem); line-height: 1.05; letter-spacing: -.02em; }
    .role { font-family: var(--display); font-weight: 500; font-size: clamp(1.1rem, 2.2vw, 1.4rem); color: var(--cyan); margin-top: 18px; }
    .intro { color: var(--muted); margin-top: 22px; max-width: 56ch; }
    .cta { display: flex; flex-wrap: wrap; gap: 14px; margin-top: 32px; }
    .btn { display: inline-block; padding: 12px 24px; border-radius: 10px; font-weight: 600; text-decoration: none; transition: transform .15s ease, background .15s ease; }
    .btn.primary { background: var(--cyan); color: #04121c; }
    .btn.primary:hover { background: #7bd8f5; transform: translateY(-2px); }
    .btn.ghost { border: 1px solid var(--line); color: var(--text); }
    .btn.ghost:hover { border-color: var(--cyan); }

    .portrait { position: relative; justify-self: center; width: min(320px, 78vw); aspect-ratio: 1; }
    .portrait::before { content: ""; position: absolute; inset: -14px; border: 1px solid var(--line); border-radius: 36px; transform: rotate(4deg); }
    .portrait .frame { position: relative; width: 100%; height: 100%; border-radius: 30px; overflow: hidden; background: var(--panel-2); border: 1px solid var(--line); display: grid; place-items: center; }
    .portrait img { width: 100%; height: 100%; object-fit: cover; display: block; }
    .portrait .initials { font-family: var(--display); font-weight: 800; font-size: 5rem; color: var(--cyan); letter-spacing: .04em; }

    /* the page's own delivery path: the one animated moment */
    .path { padding: 24px 0 64px; }
    .path h2 { font-size: 1.05rem; }
    .path p.sub { color: var(--muted); font-size: .95rem; margin-top: 4px; }
    .diagram { margin-top: 22px; overflow-x: auto; background: var(--panel); border: 1px solid var(--line); border-radius: 16px; padding: 22px 12px; }
    .diagram svg { display: block; min-width: 820px; width: 100%; height: auto; }
    .node rect { fill: var(--panel-2); stroke: var(--line); stroke-width: 1.5; animation: lit .5s ease forwards; }
    .node text { fill: var(--muted); font-family: var(--body); font-size: 15px; font-weight: 600; text-anchor: middle; animation: litText .5s ease forwards; }
    .wire { stroke: var(--line); stroke-width: 2; stroke-dasharray: 60; stroke-dashoffset: 0; fill: none; animation: wire .5s ease forwards; }
    .node rect, .node text, .wire { animation-delay: calc(var(--i) * .55s); }
    @keyframes lit { to { stroke: var(--cyan); fill: #0f2236; } }
    @keyframes litText { to { fill: var(--text); } }
    @keyframes wire { from { stroke-dashoffset: 60; stroke: var(--cyan); } to { stroke-dashoffset: 0; stroke: var(--cyan); } }

    /* sections */
    section.block { padding: 56px 0; border-top: 1px solid var(--line); }
    h2.title { font-family: var(--display); font-weight: 700; font-size: 1.7rem; letter-spacing: -.01em; margin-bottom: 26px; }
    .about p { color: var(--muted); max-width: 66ch; }
    .about p + p { margin-top: 14px; }
    .about strong { color: var(--text); font-weight: 600; }

    /* skills as a ruled table, not cards */
    .skills { border: 1px solid var(--line); border-radius: 16px; overflow: hidden; background: var(--panel); }
    .skill-row { display: grid; grid-template-columns: 220px 1fr; gap: 20px; padding: 20px 24px; }
    .skill-row + .skill-row { border-top: 1px solid var(--line); }
    .skill-row h3 { font-family: var(--display); font-size: 1rem; font-weight: 700; }
    .skill-row p.note { color: var(--muted); font-size: .88rem; margin-top: 2px; }
    .chips { display: flex; flex-wrap: wrap; gap: 8px; }
    .chips span { background: var(--panel-2); border: 1px solid var(--line); padding: 5px 13px; border-radius: 999px; font-size: .9rem; }

    /* projects: featured, with real structure */
    .project { display: grid; grid-template-columns: 1fr; gap: 14px; padding: 30px; border: 1px solid var(--line); border-radius: 18px; background: var(--panel); }
    .project + .project { margin-top: 22px; }
    .project h3 { font-family: var(--display); font-size: 1.35rem; font-weight: 700; }
    .project .desc { color: var(--muted); max-width: 70ch; }
    .flow { display: flex; flex-wrap: wrap; align-items: center; gap: 8px; margin: 6px 0; }
    .flow .step { background: var(--panel-2); border: 1px solid var(--line); border-radius: 8px; padding: 6px 12px; font-size: .88rem; }
    .flow .arrow { color: var(--amber); font-weight: 700; }
    .learned { border-left: 3px solid var(--amber); padding-left: 16px; color: var(--muted); font-size: .96rem; max-width: 70ch; }
    .learned b { color: var(--text); font-weight: 600; }
    .stack { color: var(--muted); font-size: .9rem; }
    .stack b { color: var(--text); font-weight: 600; }
    .plinks { display: flex; flex-wrap: wrap; gap: 12px; margin-top: 4px; }
    .loc { color: var(--muted); font-size: .95rem; margin-top: 14px; }

    /* contact */
    .contact-list { display: grid; gap: 14px; max-width: 520px; }
    .contact-list a { display: flex; justify-content: space-between; gap: 16px; padding: 16px 20px; border: 1px solid var(--line); border-radius: 12px; background: var(--panel); text-decoration: none; transition: border-color .15s ease; }
    .contact-list a:hover { border-color: var(--cyan); }
    .contact-list span.k { color: var(--muted); }
    footer { border-top: 1px solid var(--line); padding: 32px 0 44px; color: var(--muted); font-size: .9rem; }

    @media (max-width: 800px) {
      .hero { padding-top: 52px; }
      .hero .wrap { grid-template-columns: 1fr; gap: 44px; }
      .portrait { order: -1; width: min(220px, 60vw); justify-self: start; }
      .skill-row { grid-template-columns: 1fr; gap: 10px; }
      .links { gap: 16px; font-size: .88rem; }
      .project { padding: 22px; }
    }
    @media (prefers-reduced-motion: reduce) {
      html { scroll-behavior: auto; }
      .node rect, .node text, .wire { animation: none; }
      .node rect { stroke: var(--cyan); fill: #0f2236; }
      .node text { fill: var(--text); }
      .wire { stroke: var(--cyan); }
    }
  </style>
</head>
<body>

  <nav>
    <div class="wrap">
      <a class="brand" href="#top">Rehan Khan</a>
      <div class="links">
        <a href="#about">About</a>
        <a href="#skills">Skills</a>
        <a href="#projects">Projects</a>
        <a href="#contact">Contact</a>
      </div>
    </div>
  </nav>

  <header class="hero" id="top">
    <div class="wrap">
      <div>
        <h1>Rehan Khan</h1>
        <p class="role">Aspiring Cloud Engineer and Cloud Architect</p>
        <p class="loc">Ghazipur, Uttar Pradesh, India</p>
        <p class="intro">I am building the skills to design, deploy and operate complete systems on the cloud. I learn by shipping real projects: a serverless data pipeline on AWS and an automated CI/CD and GitOps delivery pipeline.</p>
        <div class="cta">
          <a class="btn primary" href="#projects">See my projects</a>
          <a class="btn ghost" href="https://github.com/Rehankhan37540" target="_blank" rel="noopener">GitHub</a>
          <a class="btn ghost" href="https://www.linkedin.com/in/rehan-khan-ba814a355/" target="_blank" rel="noopener">LinkedIn</a>
        </div>
      </div>

      <div class="portrait">
        <div class="frame">
          <!-- Put your photo at webapp/src/main/webapp/images/profile.jpg -->
          <img src="images/profile.jpg" alt="Portrait of Rehan Khan"
               onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
          <span class="initials" style="display:none;" aria-hidden="true">RK</span>
        </div>
      </div>
    </div>
  </header>

  <div class="path">
    <div class="wrap">
      <h2>How this page reached you</h2>
      <p class="sub">I pushed this code to GitHub. Everything after that ran on its own.</p>
      <div class="diagram">
        <svg viewBox="0 0 900 110" role="img" aria-label="Pipeline: GitHub push, Jenkins build and scan, Docker Hub image, GitOps repo tag update, ArgoCD sync, live on Kubernetes">
          <g class="wire" style="--i:1"><path d="M138 55 H168" /></g>
          <g class="wire" style="--i:2"><path d="M296 55 H326" /></g>
          <g class="wire" style="--i:3"><path d="M454 55 H484" /></g>
          <g class="wire" style="--i:4"><path d="M612 55 H642" /></g>
          <g class="wire" style="--i:5"><path d="M770 55 H800" /></g>

          <g class="node" style="--i:0"><rect x="10" y="25" width="128" height="60" rx="12"/><text x="74" y="60">Git push</text></g>
          <g class="node" style="--i:1"><rect x="168" y="25" width="128" height="60" rx="12"/><text x="232" y="60">Jenkins</text></g>
          <g class="node" style="--i:2"><rect x="326" y="25" width="128" height="60" rx="12"/><text x="390" y="60">Docker Hub</text></g>
          <g class="node" style="--i:3"><rect x="484" y="25" width="128" height="60" rx="12"/><text x="548" y="60">GitOps repo</text></g>
          <g class="node" style="--i:4"><rect x="642" y="25" width="128" height="60" rx="12"/><text x="706" y="60">ArgoCD</text></g>
          <g class="node" style="--i:5"><rect x="800" y="25" width="90" height="60" rx="12"/><text x="845" y="60">Live</text></g>
        </svg>
      </div>
    </div>
  </div>

  <section class="block about" id="about">
    <div class="wrap">
      <h2 class="title">About me</h2>
      <p>My goal is to become a <strong>Cloud Engineer and Cloud Architect</strong> who can own the whole journey: design the architecture, automate delivery, secure the system, monitor it and keep costs under control.</p>
      <p>I am based in <strong>Ghazipur, Uttar Pradesh</strong> and I build my skills through hands-on projects. Debugging real issues such as IAM permissions, timeouts, networking and build failures has taught me more than any tutorial, and it is the part of the work I value most.</p>
    </div>
  </section>

  <section class="block" id="skills">
    <div class="wrap">
      <h2 class="title">Skills</h2>
      <div class="skills">
        <div class="skill-row">
          <div><h3>Cloud on AWS</h3><p class="note">Serverless and servers</p></div>
          <div class="chips"><span>EC2</span><span>S3</span><span>Lambda</span><span>API Gateway</span><span>Athena</span><span>IAM</span><span>CloudWatch</span><span>AWS Budgets</span></div>
        </div>
        <div class="skill-row">
          <div><h3>CI/CD and GitOps</h3><p class="note">Build, scan, deploy</p></div>
          <div class="chips"><span>Jenkins</span><span>Docker</span><span>Kubernetes</span><span>ArgoCD</span><span>SonarQube</span><span>Trivy</span><span>Maven</span></div>
        </div>
        <div class="skill-row">
          <div><h3>Linux and scripting</h3><p class="note">Daily working tools</p></div>
          <div class="chips"><span>Linux</span><span>Bash scripting</span><span>Python</span><span>Pandas</span><span>Git and GitHub</span></div>
        </div>
        <div class="skill-row">
          <div><h3>Data and reporting</h3><p class="note">From raw file to dashboard</p></div>
          <div class="chips"><span>SQL on Athena</span><span>Power BI</span><span>HTML and JavaScript</span></div>
        </div>
      </div>
    </div>
  </section>

  <section class="block" id="projects">
    <div class="wrap">
      <h2 class="title">Projects</h2>

      <article class="project">
        <h3>Cloud Data Analytics Pipeline on AWS</h3>
        <p class="desc">A fully serverless pipeline, built from scratch. A user uploads a CSV from a browser page, the data is cleaned automatically, and a live Power BI dashboard updates as new data arrives.</p>
        <div class="flow" aria-label="Pipeline flow">
          <span class="step">Browser upload</span><span class="arrow">&rarr;</span>
          <span class="step">S3</span><span class="arrow">&rarr;</span>
          <span class="step">Lambda</span><span class="arrow">&rarr;</span>
          <span class="step">Pandas cleaning</span><span class="arrow">&rarr;</span>
          <span class="step">Athena</span><span class="arrow">&rarr;</span>
          <span class="step">Power BI</span>
        </div>
        <p class="desc">Uploads use pre-signed S3 URLs, so AWS credentials never touch the browser. Every file gets a JSON data-quality report (rows processed, duplicates removed, issues fixed). CloudWatch alarms and AWS Budgets keep it monitored and cost-safe.</p>
        <p class="learned"><b>What I learned:</b> IAM least-privilege permissions, Lambda timeout and memory tuning, CORS on both API Gateway and S3, Athena schema mismatches and ODBC authentication.</p>
        <p class="stack"><b>Stack:</b> Lambda, S3, API Gateway, Athena, IAM, CloudWatch, Python (Pandas), Power BI, HTML/JS</p>
        <div class="plinks"><a class="btn ghost" href="https://github.com/Rehankhan37540/cloud-data-analytics-pipeline" target="_blank" rel="noopener">View code and setup guide</a></div>
      </article>

      <article class="project">
        <h3>End-to-end CI/CD with GitOps</h3>
        <p class="desc">Every push to GitHub builds, tests, scans and deploys this application with no manual step. This portfolio is the live proof.</p>
        <div class="flow" aria-label="CI/CD flow">
          <span class="step">GitHub webhook</span><span class="arrow">&rarr;</span>
          <span class="step">Jenkins CI</span><span class="arrow">&rarr;</span>
          <span class="step">SonarQube</span><span class="arrow">&rarr;</span>
          <span class="step">Docker image</span><span class="arrow">&rarr;</span>
          <span class="step">Trivy scan</span><span class="arrow">&rarr;</span>
          <span class="step">CD job</span><span class="arrow">&rarr;</span>
          <span class="step">ArgoCD</span><span class="arrow">&rarr;</span>
          <span class="step">Kubernetes</span>
        </div>
        <p class="desc">The CI job pushes a versioned image tag. A separate CD job updates the tag in a GitOps repository, and ArgoCD syncs the change to the cluster, so every deployment is traceable in Git and easy to roll back.</p>
        <p class="learned"><b>What I learned:</b> debugging authentication failures between Jenkins jobs, public versus private networking inside a VPC, managing disk space on build agents, and why versioned image tags are safer than <i>latest</i>.</p>
        <p class="stack"><b>Stack:</b> Jenkins, Maven, SonarQube, Docker, Trivy, ArgoCD, Kubernetes (EKS), AWS EC2, GitHub</p>
        <div class="plinks">
          <a class="btn ghost" href="https://github.com/Rehankhan37540/register-app" target="_blank" rel="noopener">Application repository</a>
          <a class="btn ghost" href="https://github.com/Rehankhan37540/gitops-register-app" target="_blank" rel="noopener">GitOps repository</a>
        </div>
      </article>
    </div>
  </section>

  <section class="block" id="contact">
    <div class="wrap">
      <h2 class="title">Contact</h2>
      <div class="contact-list">
        <a href="mailto:rehankhan37237@gmail.com"><span class="k">Email</span><span>rehankhan37237@gmail.com</span></a>
        <a href="https://www.linkedin.com/in/rehan-khan-ba814a355/" target="_blank" rel="noopener"><span class="k">LinkedIn</span><span>Rehan Khan</span></a>
        <a href="https://github.com/Rehankhan37540" target="_blank" rel="noopener"><span class="k">GitHub</span><span>github.com/Rehankhan37540</span></a>
      </div>
    </div>
  </section>

  <footer>
    <div class="wrap">Rehan Khan, Ghazipur, Uttar Pradesh. Built and deployed automatically with Jenkins, Docker, ArgoCD and Kubernetes.</div>
  </footer>

</body>
</html>
