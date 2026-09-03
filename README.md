# Ibrahim Mahmoud, soccer site

`index.html` is the whole site. One file, no build step, nothing to install.
Double-click it to open it in your browser and see your changes.

## Still blank, fill these in before you send it to anyone

- [ ] At least one highlight video (EDIT ME #11). The two MP4 files in
      `unsorted` are about 80 MB each, far too big for a web page. Upload them
      to YouTube as Unlisted, then paste the video IDs in.
- [ ] Schedule. It is a single TBD panel right now. When fixtures are set,
      ask and I will build the table back (EDIT ME #13)
- [ ] Opponent name in the "Full 90" video card
- [ ] Which school the 2021-2023 JV/varsity soccer was for
- [ ] Save the ranking graphic as `photos/signature-school.jpg` (see below)

## Signature School ranking

Now attributed: "According to U.S. News & World Report, it is the number one
charter school in the nation, its third time since 2022, and the number two high
school in the nation for the fourth year running." The fact table carries the
same source and the 2026-2027 year.

**The ranking graphic is not on the page yet.** Save the Signature School
picture as `photos/signature-school.jpg` and it appears automatically, right
under that paragraph. Until the file exists the block hides itself, so nothing
looks broken. Any ordinary photo size is fine; keep it under about 400 KB.

## Why photos sometimes do not appear

The page loads pictures from the `photos` folder sitting next to `index.html`.
They only show when those two stay together.

- **Opening `index.html` from this folder works.** Double-click it.
- **A copy of `index.html` on its own will not work.** If you email the file or
  drag it somewhere else, there is no `photos` folder beside it, so the browser
  shows the alt text instead of the picture. Move the whole folder.

## Photos

`photos` holds 18 web copies, about 3.8 MB in total. Your originals stay in the
year folders and are never touched.

| Where | File |
|---|---|
| Hero | `hero.jpg` |
| Metro Indoor card | `metro-2017.jpg` |
| Sporting card | `sporting-2025b.jpg` |
| School Soccer card | `school-2021.jpg` |
| Golden Cup card | `goldencup-team.jpg` |
| ODP card | `odp-a.jpg` |
| LouCity card | `loucity-team.jpg` |
| Montage under the bio | `journey-collage.jpg` |
| Gallery | the other 12, one per figure |

Clicking a gallery photo opens it full size. Arrow keys move between pictures,
Escape closes.

## How to edit it

Open `index.html` in any text editor (TextEdit, VS Code, Notepad).
Search for `EDIT ME`. The marked spots, in order:

| # | What it changes |
|---|-----------------|
| 1 | Page title + the description Google shows |
| 2 | Colors. The whole white/red/blue palette lives here |
| 3 | The crest and the wordmark in the top-left |
| 3b | The Instagram / SportsRecruits / email links beside your name |
| 4 | The class-year and position badge |
| 5 | Your intro line |
| 6 | Hero photo |
| 7 | Jersey number |
| 9 | Your bio paragraphs |
| 10 | The recruiting fact table |
| 11 | Highlight videos (five self hosted mp4 files) |
| 12 | Recruiting profile links (SportsRecruits, Hudl) |
| 13 | Schedule rows (date, event, location, link) |
| 14 | Gallery photos |
| 15 | Your email + profile buttons |
| 16 | Player + coach contact info |
| 17 | Social links |
| 18 | The timeline (one block per entry) |
| 19 | The quote band under About |
| 20 | The montage under your bio |
| 21 | The Signature School ranking graphic |

## The crest

The logo is drawn in the page itself, not an image file, so it stays sharp at
any size and follows your colour palette. It is a serifed I whose top and
bottom bars run into the left leg of the M, set in a hexagon.

The two letters are **filled paths, not strokes**. That is deliberate. With
strokes, the corner joins decide where the shape actually ends: mitred corners
grew spikes about six units above the I's top bar, and bevelled ones cut the M's
peaks at an angle. Filled outlines put every edge exactly where the coordinates
say, so both letters top out on y=21, bottom out on y=43, and the mark sits at
32,32 in the 64 unit box. If you edit it, keep it filled.

The four `<path>` lines inside `class="crest-mark"` are the letters:

```html
<path d="M17 21h12"/>              <!-- top bar of the I    -->
<path d="M23 21v22"/>              <!-- stem of the I       -->
<path d="M17 43h12"/>              <!-- bottom bar of the I -->
<path d="M29 43V21l9 12 9-12v22"/> <!-- the M               -->
```

The same shape is repeated in the `<link rel="icon">` line near the top of the
file, which is the little picture on the browser tab. If you change one, change
both.

## The timeline

`Timeline` in the nav, between About and Highlights. One `<article class="tl-item">`
block per entry. The `<span>` holds the years, which can be a range like `2014-16`
or a single year. Entries run in date order and overlapping spans are fine.

```html
<article class="tl-item reveal">
  <div class="tl-year"><span>2025-26</span></div>
  <div class="tl-content">
    <div class="tl-bg"></div>
    <div class="tl-text">
      <h3>LouCity Academy</h3>
      <p>Signed with LouCity Academy and joined the Oldham Black team, wearing #1.</p>
    </div>
  </div>
</article>
```

To put a photo behind an entry, drop the image in `photos` and add it to that
entry's `tl-bg`:

```html
<div class="tl-bg" style="background-image:url(photos/2021.jpg)"></div>
```

To delete an entry, delete its whole `<article>...</article>`. To add one, copy a
block and change the years. Cards alternate left and right automatically, and the
line fills as you scroll, so you don't have to touch any of that.

## The schedule

One `<tr>` per event, with four cells: date, event, location, details. Copy a row
to add an event, delete a row to remove one.

Inside the date and event cells, `<span class="sub">` and `<span class="yr">` set
the small grey second line. The details cell holds either an event link
(`class="ev-link"`) or a status pill: `up` for confirmed, `d` for grey.

Two showcases are listed with "2027 date TBA" because only the 2026 dates have
been published. Put the real dates in as soon as they are announced, and delete
the note under the table once nothing is TBA.

## How it adapts to screen size

Two breakpoints do the work.

**940px.** Above it the menu sits in one row and the timeline runs down a centre
rail with cards either side. Below it the menu becomes the burger and the
timeline stacks into full width cards with the years as red labels on top.
Both switch together because the brand, three icons and six links need about
832px on one line, and two timeline columns plus the rail need similar room.

**760px.** Below this the schedule table turns into stacked cards, since a four
column table cannot fit a phone and scrolling sideways hides the venue, which is
the part a coach actually needs. The gallery also drops to two columns here.

Checked at 320, 375, 390, 414, 430, 600, 768, 820, 870, 900, 960, 1024, 1280 and
1440. If you edit the layout, re-check 414 and 870; both used to break.

## The highlights videos

The five reels play from YouTube. One hero plus four breakdowns in a 2x2 grid
that stacks on phones.

| Player | YouTube id |
|---|---|
| Best of Ibrahim Mahmoud | `FRGJIwtqi94` |
| Watch My Defending & Recovery | `xF3yAjr6ew4` |
| Watch My Incisive Passing | `py1TkDlnMRU` |
| Watch My Overlapping Runs & Movement | `pplK_cufi20` |
| Watch My Composure & Play Under Pressure | `fEnb6kXkSn8` |

To change one, put its id in `data-yt` on that player. The id is the part after
`embed/` in YouTube's share code.

**Nothing loads from YouTube until someone clicks.** Each player is a still with
a play button until then, so five videos cost five images rather than five
embedded players. The stills come from `photos/`, set in `background-image`.

**Why not self hosted.** The mp4 files are still in `videos/` but the site no
longer uses them, and they are excluded from the repo. GitHub caps a single file
at 100 MB, which forced those five down to 640x364, soft for showing technique.
YouTube serves full resolution with proper seeking and keeps 254 MB out of the
repo. You can delete the `videos` folder whenever you like.

## Opening the pages locally

**YouTube will not play from a `file://` address.** Double-clicking `passing.html`
gives a black player and "Video player configuration error, Error 153". That is
YouTube refusing to embed without a real web origin, not a fault in the page.

The same file works perfectly once it is served over http or https, which is what
GitHub Pages does. So the error disappears the moment the site is deployed. To
check a page locally before then, run this from the project folder and open
http://localhost:8000:

    python3 -m http.server 8000

## Older note on YouTube

1. Upload the video to YouTube (Unlisted is fine, it still plays here).
2. Copy the ID from the URL. In `youtube.com/watch?v=ABC123xyz` the ID is `ABC123xyz`.
3. Paste it between the quotes: `data-youtube="ABC123xyz"`

The thumbnail and play button appear automatically. Nothing loads from YouTube
until someone clicks, so the page stays fast.

## Adding photos

Drop image files into the `photos` folder, then follow EDIT ME #6 and #14.
Resize big photos to about 1600px wide first so the page loads quickly.

## Putting it online with GitHub

The folder is already a git repository. Only the site is tracked: `index.html`,
`README.md`, `photos/` and this file. Your year folders, `unsorted/` and the
Amari Felton page are excluded on purpose, so the 500 MB of originals never
leave your Mac.

**First time only**

1. On github.com click New repository. Name it, make it **Public**, and do not
   add a README.
2. In Terminal, from this folder:

       git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
       git branch -M main
       git push -u origin main

3. In the repo: Settings, then Pages, then Source: Deploy from a branch, main,
   /(root), Save.

**Every time after that**

Double-click **publish.command**. It shows what changed, commits it and uploads
it. The site updates about a minute later. If nothing changed it says so and
closes.

If the upload fails it is almost always sign-in. GitHub no longer accepts your
account password from Terminal, so either install GitHub Desktop, which handles
it for you, or create a Personal Access Token and use that as the password.

## Other ways to put it online

- **Netlify Drop**: go to app.netlify.com/drop and drag this whole folder in. Live in seconds.
- **GitHub Pages**: push the folder to a repo, then Settings → Pages → deploy from main.
- **Cloudflare Pages**: same drag-and-drop idea.

Any of these will give you a free URL. You can point your own domain at it later.
