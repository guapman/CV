
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Konstantin Alekseev"
#let locale-catalog-page-numbering-style = context { "Konstantin Alekseev - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Oct 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.5cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 1.9cm
#let design-page-right-margin = 1.9cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Konstantin Alekseev

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Dubai, UAE],
  [#box(original-link("mailto:kalekseev.spb@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)kalekseev.spb\@gmail.com])],
  [#box(original-link("tel:+971-52-397-2904")[#fa-icon("phone", size: 0.9em) #h(0.05cm)052 397 2904])],
  [#box(original-link("https://linkedin.com/in/guapman")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)guapman])],
  [#box(original-link("https://github.com/guapman")[#fa-icon("github", size: 0.9em) #h(0.05cm)guapman])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Senior Software Engineer & Team Lead with 15+ years of experience designing and delivering scalable,  high-performance systems across healthcare, aviation, and media domains.  Collaborated with cross-functional teams to build real-time communication platforms, AI-powered services,  and low-latency video streaming solutions used by thousands of end users. Expert in C\/C++, Python and Scala, with deep knowledge of distributed architectures, VoIP, WebRTC,  and AI-driven data processing pipelines. Strong background in system optimization,  cross-platform development, and embedded\/IoT integration. Known for bridging complex technical design with business objectives — from developing  compression algorithms adopted in commercial codecs to leading AI-augmented telehealth  platforms that improve operational efficiency by up to 30\%.  Passionate about building reliable, secure, and efficient systems that scale.
]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[M.C.S]],
  middle-content: [
    #strong[Saint Petersburg State University of Aerospace and Instrumentation], #emph[Computer Science] - Signal Processing \/ Embedded systems \/ Automated control systems
  ],
  right-content: [
    Sept 2001 – Sept 2007
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[iO Health], #emph[Team Leader]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Led a cross-functional team of 6 engineers delivering a next-generation telehealth platform integrating secure video consultations, real-time IoT medical device data, and AI-assisted workflows for providers across the UAE and KSA.],[Designed and deployed AI-driven workflow automation \(RAG-based agent system\) that reduced administrative overhead for clinics by \~30\%, improving patient throughput and response time.],[Built data ingestion microservices for third-party medical devices and wearables, enabling secure and scalable health data storage and analytics.],[Collaborated with product and compliance teams to align platform capabilities with local healthcare data regulations \(DHA, MOH\).],[Owned the VoIP and messaging platform, integrating WebRTC and RTP pipelines and ensuring compliance with UAE telecom regulations.],[Led migration to Zoom SDK to ensure UAE telecom compliance, maintaining all core features while cutting infrastructure maintenance costs by 40\%.],[Stack: #emph[Scala, Java, C, C++, Python, AI\/RAG\/LLMs, RTP\/STUN, WebRTC, Cassandra, Postgres, AWS\/OCI, Docker]],)
  ],
  right-content: [
    Dubai, UAE

July 2022 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Shamsa Tech \(rebranded as iO Health in 2022\)], #emph[Desktop Client Team Leader \/ Backend Developer]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Design and development of a secure, B2B communication platform supporting encrypted messaging and real-time video conferencing for enterprise clients.],[Built the entire desktop client from scratch \(C++\/Qt\), integrating advanced VoIP and video streaming features via WebRTC and Janus Media Server.],[Designed a custom binary communication protocol with end-to-end encryption, achieving less than 150 ms latency and meeting strict corporate security standards.],[Collaborated with backend team to develop and refine protocol and APIs, ensuring efficient media routing and authentication layers.],[Platform was successfully acquired in 2019 and now serves as the core desktop component of iO Health's telehealth ecosystem.],[Stack: #emph[C, C++, Scala, Java, Qt, RTP\/STUN, WebRTC, OpenSSL, Janus Media Server, Docker]],)
  ],
  right-content: [
    Dubai, UAE \(Remote\)

Dec 2015 – June 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[NITA LLC], #emph[Senior Software Developer]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Designed and implemented the Pseudo-Pilot Workspace, enabling simultaneous simulation of up to 500 concurrent aircraft interactions with high real-time fidelity.],[Developed and integrated the AMAN\/DMAN \(Arrival\/Departure Management\) service, improving airspace throughput efficiency by \~20\% through optimized sequencing algorithms.],[Refactored legacy C++ components and introduced modern frameworks.],[Collaborated with air traffic domain experts to ensure regulatory compliance and reliability of simulation outcomes under strict latency and safety constraints.],[Stack: #emph[C, C++, Qt, TCP\/IP]],)
  ],
  right-content: [
    Saint-Petersburg, Russia

Jan 2011 – May 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[LG Electonics], #emph[Research Engineer]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Contributed to the development and release of multiple global mobile phone models \(GD880, BL40, KM900 Arena, GD510, KP500, KF300\), collectively shipped to millions of users worldwide.],[Embedded experimental HDR photo enhancement pipeline.],[Stack: #emph[C, C++, Assembler, Internal company SDKs]],)
  ],
  right-content: [
    Saint-Petersburg, Russia

Apr 2008 – Dec 2010
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Prosecurity], #emph[Software Developer]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Designed and developed an automotive GPS\/GSM-based security system, integrating embedded firmware, communication protocols, and monitoring interfaces.],[Programmed Microchip and ARM microcontrollers in C and Assembly for real-time tracking, event detection, and secure data transmission.],[Developed custom lightweight data-exchange protocols \(over TCP\/IP, I2C, SPI, RS232\).],[Built a desktop monitoring interface for live vehicle tracking and alerts, supporting concurrent monitoring of hundreds of active devices.],[Stack #emph[C, C++, Assembly, Microchip, ARM, TCP\/IP, I2C, SPI, RS-232]],)
  ],
  right-content: [
    Saint-Petersburg, Russia

Jan 2007 – Apr 2008
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[XVD Corporation \(USA\)], Software Developer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed and integrated a novel DCT coefficient coding algorithm \(based on university research\) that reduced video data size by \~20\% while preserving visual quality, directly decreasing bandwidth usage in production codecs.],[Enhanced bitrate control and entropy coding modules in the company’s commercial video codec suite, improving adaptive streaming efficiency under varying network conditions.],[Collaborated with R&D team on codec integration and testing for H.264\/H.265 pipelines used in broadcast and IP video transmission.],[Stack: #emph[C, C++, Assembler, Entropy coding, RTP, H264, H265, JPEG]],)
  ],
  right-content: [
    Saint-Petersburg, Russia

Sept 2005 – Sept 2006
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[Securicam Insight IP-Cam]
  ],
  right-content: [
    2014 – 2016
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed IP camera firmware with modern dashboard.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Nekaka Files Sharing Client]
  ],
  right-content: [
    2012 – 2013
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Windows file-sync client for cloud service \(https:\/\/habr.com\/en\/companies\/nekaka\/articles\/182040\).],)
  ],
)



== Technologies


#one-col-entry(
  content: [#strong[Languages:] C++, C, Python, Scala, Java, Objective-C, SQL]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Concepts and technologies:] Agile, AI\/RAG, VoIP, Networks, Cryptography, Multi-threading, Distributed systems]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[IDE and tools:] IntelliJ Idea, PyCharm, VSCode, Docker, k8s, Jenkins, Git, bash, Jira, Clickup, n8n, Wireshark]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Platforms:] Linux, macOS, Windows]
)


