\version "2.24.2"

% Thần Hỏa - Inspired Piano Version (LilyPond)
% Phong cách: cổ phong - bi tráng
% 4/4, tempo ~96 bpm, piano 2 tay, hợp âm chồng (block chords) tay trái

\header {
  title = "Thần Hỏa — Inspired Piano Version"
  composer = \markup { \italic "Inspired version — original composition" }
  meter = "4/4"
  tagline = "Arranged for piano (2 hands) — inspired, not a transcription"
}

global = {
  \time 4/4
  \tempo 4 = 96
  \key d \minor
  \clef treble
}

% ====== Right hand melody (treble) - relative to d' ======
right = \relative d' {
  \global
  % --- Intro motif (8 bars) ---
  \repeat volta 2 {
    \mark \markup { \italic "Intro" }
    % Bar 1-2
    a4( d8 c) d4 r4
    f4( e8 d) e4 r4
    % Bar 3-4
    d'4( c8 b) a4 r4
    bes4( a8 g) f4 r4
  }
  % --- Decorative run into Verse (2 bars) ---
  \grace { a32( b32) } d8( c) b4 a4
  g4( f8 e) d4 r4

  % --- Verse (16 bars) ---
  \mark \markup { \italic "Verse 1" }
  f'4( e8 d) c4 d4
  a4( g8 f) e4 f4
  d4( c8 b) a4 g4
  bes4( a8 g) f4 e4

  f'4( e8 d) c4 d4
  a4( g8 f) e4 f4
  d4( c8 b) a4 g4
  a2( g2) \bar "|."

  % --- Pre-Chorus / Build (4 bars) ---
  \mark \markup { \italic "Pre-Chorus" }
  d'4( f8 e) d4 c4
  e4( f8 g) a4 g4
  a4( bes8 c) d4 c4
  b4( a8 g) f4 e4

  % --- Chorus (16 bars) ---
  \mark \markup { \italic "Chorus" }
  d'4( f8 a) d4 f4
  e4( g8 b) e4 g4
  f4( a8 c) f'4 a4
  e4( g8 b) e4 g4

  a'4( g8 f) e4 d4
  f4( e8 d) c4 b4
  d4( c8 b) a4 g4
  a2( g2) \bar "|."

  % --- Verse 2 (shorter, 8 bars) ---
  \mark \markup { \italic "Verse 2" }
  f'4( e8 d) c4 d4
  a4( g8 f) e4 f4
  d4( c8 b) a4 g4
  a4( g8 f) e4 d4

  f'4( e8 d) c4 d4
  a4( g8 f) e4 f4
  d4( c8 b) a4 g4
  a2( g2)

  % --- Bridge (8 bars) darker color) ---
  \mark \markup { \italic "Bridge" }
  \override DynamicText #'font-size = #-4
  \dynamic p
  g'4( f8 e) d4 c4
  bes4( a8 g) f4 e4
  d4( c8 b) a4 g4
  f4( e8 d) c4 b4

  \dynamic mf
  c'4( b8 a) g4 f4
  e4( d8 c) b4 a4
  a4( g8 f) e4 d4
  \bar "|."
}

% ====== Left hand accompaniment (bass) - relative to d ======
left = \relative d {
  \clef bass
  \key d \minor
  \time 4/4

  % Intro - block chords (each bar: whole-note block split as half notes for clarity)
  \mark \markup { \italic "Intro - left (block chords)" }
  <d f a d>1\mf
  <g bes d g>1
  <f a c f>1
  <bes d f bes>1

  <d f a d>1
  <g bes d g>1
  <f a c f>1
  <d f a d>1

  % Pre-verse arpeggiated blocks
  <d a f>1
  <g d bes>1

  % Verse 1 - stronger block chords (each bar a dotted half + quarter feel)
  \mark \markup { \italic "Verse 1 - left (block chords)" }
  <d f a d>2. <d f a d>4
  <g bes d g>2. <g bes d g>4
  <f a c f>2. <f a c f>4
  <bes d f bes>2. <bes d f bes>4

  <d f a d>2. <d f a d>4
  <g bes d g>2. <g bes d g>4
  <f a c f>2. <f a c f>4
  <d f a d>1

  % Pre-Chorus
  <d a f>1
  <e b g>1
  <f c a>1
  <g d b>1

  % Chorus - big, wide block chords (octave doubled)
  \mark \markup { \italic "Chorus - left (strong blocks, octave doubling)" }
  <d,, d' f a>1\ff
  <g,, g' bes d>1
  <f,, f' a c>1
  <e,, e' g b>1

  <a,, a' c e>1
  <f,, f' a c>1
  <d,, d' f a>1
  <d,, d' f a>1

  % Verse 2 (short) - softer block chords
  \dynamic mf
  <d f a d>1
  <g bes d g>1
  <f a c f>1
  <d f a d>1

  <d f a d>1
  <g bes d g>1
  <f a c f>1
  <d f a d>1

  % Bridge - darker, lower chords
  \dynamic p
  <b, d f b>1
  <c, e g c>1
  <a, c e a>1
  <g, b d g>1

  % Outro - slow descending block chords
  \dynamic mf
  <d f a d>1
  <c e a c>1
  <b d g b>1
  <d, f a d>1
}

% Combine into a piano staff and produce output (layout + midi)
\score {
  <<
    \new PianoStaff <<
      \new Staff = "right" \right
      \new Staff = "left" \left \clef bass \left
        \relative d { \left }
      \right
    >>
  >>
  \layout {
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
    \context {
      \PianoStaff
      \override VerticalAxisGroup #'remove-first = ##t
    }
  }
  \midi {
    \tempo 4 = 96
    \context {
      \PianoStaff
      \consists "Merge_rests_engraver"
    }
    % Adjust volume or instrument if desired:
    % programChange = #0  % default acoustic grand
  }
}
