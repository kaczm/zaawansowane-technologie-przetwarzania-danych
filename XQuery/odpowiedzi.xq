(:zadanie 5:)
(:
for $autor in doc("db/bib/bib.xml")//author
return $autor/last
:)

(:zadanie 6:)
(:
for $ksiazka in doc("db/bib/bib.xml")//book
  for $tytul in $ksiazka/title
    for $autor in $ksiazka/author
      return
      <ksiazka>
        {$autor}
        {$tytul}
      </ksiazka>
:)

(:zadanie 7:)
(:
for $ksiazka in doc("db/bib/bib.xml")//book
  for $tytul in $ksiazka/title
    for $autor in $ksiazka/author
      return
      <ksiazka>
        <autor>{$autor/last/text()}{$autor/first/text()}</autor>
        <tytul>{$tytul/text()}</tytul>
      </ksiazka>  
:)

(:zadanie 8:)
(:
for $ksiazka in doc("db/bib/bib.xml")//book
  for $tytul in $ksiazka/title
    for $autor in $ksiazka/author
      return
      <ksiazka>
        <autor>{$autor/last/text() || " " || $autor/first/text()} </autor>
        <tytul>{$tytul/text()}</tytul>
      </ksiazka>  
:)

(:zadanie 9:)
(:
let $path := "db/bib/bib.xml"
return <wynik>
{
for $ksiazka in doc($path)//book
  for $tytul in $ksiazka/title
    for $autor in $ksiazka/author
    return
      <ksiazka>
        <autor>{$autor/last/text() || " " || $autor/first/text()} </autor>
        <tytul>{$tytul/text()}</tytul>
      </ksiazka>
}
</wynik>
:)

(:zadanie 10:)
(:
for $ksiazka in doc("db/bib/bib.xml")//book[title = 'Data on the Web']
  return <imiona> {
    for $autor in $ksiazka/author
      return <imie>{$autor/first/text()}</imie>
  }
  </imiona>
:)

(:zadanie 11:)
(:
for $ksiazka in doc("db/bib/bib.xml")//book[title = 'Data on the Web']
  return <DataOnTheWeb> {$ksiazka} </DataOnTheWeb>
:)

(:
for $ksiazka in doc("db/bib/bib.xml")//book
  where $ksiazka/title = 'Data on the Web'
  return <DataOnTheWeb> {$ksiazka} </DataOnTheWeb>
:)

(:zadanie 12:)
(:
for $ksiazka in doc("db/bib/bib.xml")//book
  where contains($ksiazka, 'Data')
  return <Data>
  {
      for $autor in $ksiazka/author
        return <nazwisko>{$autor/last/text()}</nazwisko>
  }
  </Data>
:)

(:zadanie 13:)
(:
for $ksiazka in doc("db/bib/bib.xml")//book
  where contains($ksiazka, 'Data')
  return <Data>
  {$ksiazka/title}
  {
      for $autor in $ksiazka/author
        return <nazwisko>{$autor/last/text()}</nazwisko>
  }
  </Data>
:)

(:zadanie 14:)
(:
for $ksiazka in doc("db/bib/bib.xml")//book
  let $autorzy := $ksiazka/author
  where count($autorzy) <= 2
  return <title>{$ksiazka/title/text()}</title>
:)

(:zadanie 15:)
(:
for $ksiazka in doc("db/bib/bib.xml")//book
  let $autorzy := $ksiazka/author
  return <ksiazka>
    {$ksiazka/title}
    <autorow>{count($autorzy)}</autorow>
  </ksiazka>
:)
  
(:zadanie 16:)
(:
let $lata := doc("db/bib/bib.xml")//book/@year
return <przedzial>
  {min($lata) || ' - ' || max($lata)} 
</przedzial>
:)

(:zadanie 17:)
(:
let $ceny := doc("db/bib/bib.xml")//price
return <różnica>
  {max($ceny) - min($ceny)} 
</różnica>
:)

(:zadanie 18:)
(:
let $najtansza_cena := min(doc("db/bib/bib.xml")//price)
return <najtańsze>
{
  for $ksiazka in doc("db/bib/bib.xml")//book
  where $ksiazka/price = $najtansza_cena
  return <najtańsza>
    {$ksiazka/title}
    {$ksiazka/author}
  </najtańsza>
}
</najtańsze>
:)

(:zadanie 19:)
(:
for $nazwisko in distinct-values(doc("db/bib/bib.xml")//last)
return <autor>
  <last>{$nazwisko}</last>
  {for $ksiazka in doc("db/bib/bib.xml")//book where $ksiazka/author/last = $nazwisko return $ksiazka/title}
</autor>
:)

(:zadanie 20:)
(:
let $path := "db/shakespeare"
return <wynik>
{
  for $nazwa in collection($path)/PLAY/TITLE
  return $nazwa
}
</wynik>
:)

(:zadanie 21:)
(:
let $path := "db/shakespeare"
for $sztuka in collection($path)/PLAY[.//LINE[contains(., "or not to be")]]
  return $sztuka/TITLE
:)
(:zadanie 22:)
let $path := "db/shakespeare"
return <wynik>
{
  for $sztuka in collection($path)/PLAY
  return <sztuka tytul="{$sztuka/TITLE/text()}">
    <postaci>{count($sztuka//PERSONA)}</postaci>
    <aktow>{count($sztuka//ACT)}</aktow>
    <scen>{count($sztuka//SCENE)}</scen>
  </sztuka>
}
</wynik>

