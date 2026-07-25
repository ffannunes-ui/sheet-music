\version "2.26.0"

\header {
  title = "Untitled"
  composer = "Composer"
}

\score {
  \relative c' {
    c4
  }

  \layout {}
  \midi {}
}\version "2.22.0"

\header {
  title = "Quando Deus Observa o Mundo"
  subtitle = "Hino Congregacional de Estilo Avançado"
  composer = "Harmonização a 4 Vozes (SATB)"
  tagline = "Criado para leitura de pianistas de nível superior."
}

global = {
  \key d \major
  \time 4/4
  \tempo "Andante Solene" 4 = 84
}

% Cifras Avançadas para o Piano
harmonies = \chordmode {
  % Estrofe
  d2:maj7 d:6 | cis2:m7.5- fis:7.9- | b1:m9 | e2/gis e:7 |
  e1:m9 | a2:7.13 a:7.13- | d2:maj7 g/a | d2:maj7 a:7.alt |
  % Coro
  g2:maj7 g:6 | fis2:m7 b:7.9- | e2:m9 a:7.13 | d2:maj7 d:7.9- |
  g1:maj7 | c1:9 | d2/a b:7.9- | e2:m7 a:7.9- | d1 |
}

soprano = \relative c'' {
  \global
  % Estrofe
  a2 fis4 g | e2 fis4 g | a1 | b2 b4 b |
  g2 e4 fis | g2 a4 b | a1 | fis2 e \bar "||"
  % Coro
  b'2 b4 b | a2 a4 a | g2 g4 g | fis1 |
  b2 b4 c | d2 c4 b | a2 fis4 g | e2 e4 e | d1 \bar "|."
}

alto = \relative c' {
  \global
  % Estrofe
  fis2 d4 d | cis2 cis4 e | cis2( d) | d2 d4 d |
  b2 b4 d | cis2 e4 g | fis2( e) | d2 cis |
  % Coro
  d2 d4 d | cis2 dis4 dis | e2 e4 e | d1 |
  d2 d4 g | e2 g4 g | fis2 d4 d | d2 cis4 cis | d1 |
}

tenor = \relative c' {
  \global
  \clef bass
  % Estrofe
  a2 a4 b | a2 ais4 ais | b1 | b2 gis4 gis |
  g2 g4 b | a2 cis4 e | d2( cis) | a2 g |
  % Coro
  g2 b4 b | a2 c4 c | b2 cis4 cis | d1 |
  g,2 b4 b | g2 bes4 bes | d2 b4 b | b2 a4 g | fis1 |
}

baixo = \relative c {
  \global
  \clef bass
  % Estrofe
  d2 d4 d | cis2 fis4 fis | b,1 | gis2 e'4 e |
  e2 e4 e | a,2 a4 a | d1 | d2 a |
  % Coro
  g2 g4 g | fis2 b4 b | e,2 a4 a | d1 |
  g,2 g4 g | c2 c4 c | a2 b4 b | e,2 a4 a | d1 |
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new PianoStaff <<
      \new Staff = "upper" <<
        \clef treble
        \new Voice = "soprano" { \voiceOne \soprano }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Staff = "lower" <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "baixo" { \voiceTwo \baixo }
      >>
    >>
  >>
  \layout {
    \context {
      \Staff
      \consists "Merge_rests_engraver"
    }
  }
  \midi { }
}
