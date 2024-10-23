SELECT english_title, artist, brightness, MAX(contrast) AS 'MAX CONTRAST' FROM views WHERE artist = 'Hokusai' ORDER BY contrast DESC;
