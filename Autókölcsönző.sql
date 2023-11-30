CREATE TABLE Jarmuvek (
    jarmu_ID SERIAL PRIMARY KEY,
    tipus VARCHAR(255) NOT NULL,
    marka VARCHAR(255) NOT NULL,
    modell VARCHAR(255) NOT NULL,
    rendszam VARCHAR(255) NOT NULL,
    evjarat INT NOT NULL,
    szin VARCHAR(255) NOT NULL,
    dij_per_nap NUMERIC NOT NULL
);

CREATE TABLE Ugyfelek (
    ugyfel_ID SERIAL PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    cim VARCHAR(255) NOT NULL,
    telefonszam VARCHAR(255) NOT NULL,
    email_cim VARCHAR(255)
);

CREATE TABLE Kolcsonzesek (
    kolcsonzes_ID SERIAL PRIMARY KEY,
    jarmu_ID INT REFERENCES Jarmuvek(jarmu_ID),
    ugyfel_ID INT REFERENCES Ugyfelek(ugyfel_ID),
    kezdo_datum DATE NOT NULL,
    vege_datum DATE NOT NULL,
    visszahozott BOOLEAN NOT NULL,
    osszesen_fizetendo NUMERIC NOT NULL
);

CREATE TABLE Szamlak (
    szamla_ID SERIAL PRIMARY KEY,
    kolcsonzes_ID INT REFERENCES Kolcsonzesek(kolcsonzes_ID),
    kibocsatas_datum DATE NOT NULL,
    hatarido DATE NOT NULL,
    fizetett BOOLEAN NOT NULL,
    osszeg NUMERIC NOT NULL
);

INSERT INTO Jarmuvek (jarmu_ID, tipus, marka, modell, rendszam, evjarat, szin, dij_per_nap)
VALUES (1, 'Személyautó', 'Toyota', 'Corolla', 'ABC123', 2020, 'Fekete', 5000),
       (2, 'Teherautó', 'Ford', 'Transit', 'DEF456', 2018, 'Fehér', 8000),
       (3, 'Személyautó', 'Honda', 'Civic', 'GHI789', 2019, 'Piros', 6000),
       (4, 'Személyautó', 'Volkswagen', 'Golf', 'ABC001', 2019, 'Fehér', 6000),
       (5, 'Teherautó', 'Iveco', 'Daily', 'DEF002', 2017, 'Kék', 8000),
       (6, 'Személyautó', 'Ford', 'Mustang', 'BCD010', 2022, 'Narancs', 7500),
       (7, 'Személyautó', 'Audi', 'A4', 'JKL004', 2018, 'Fekete', 6500),
       (8, 'Teherautó', 'Volvo', 'FH', 'MNO005', 2016, 'Szürke', 8500),
       (9, 'Teherautó', 'Scania', 'R Series', 'VWX008', 2015, 'Fehér', 9000),
       (10,'Személyautó', 'BMW', '3 Sorozat', 'STU007', 2017, 'Arany', 7000);

INSERT INTO Ugyfelek (ugyfel_ID, nev, cim, telefonszam, email_cim)
VALUES (1, 'Kovács Péter', 'Budapest, Kossuth u. 10.', '+3612345678', 'kovacs.peter@example.com'),
       (2, 'Nagy Anita', 'Debrecen, Piac u. 5.', '+3623456789', 'nagy.anita@example.com'),
       (3, 'Szabó Gábor', 'Szeged, Rákóczi u. 20.', '+3634567890', 'szabo.gabor@example.com'),
       (4, 'Tóth András', 'Pécs, Kossuth u. 15.', '+36225556666', 'toth.andras@example.com'),
       (5, 'Horváth Judit', 'Miskolc, Damjanich u. 8.', '+36111223344', 'horvath.judit@example.com'),
       (6, 'Kiss László', 'Szombathely, Ady Endre u. 7.', '+36335557777', 'kiss.laszlo@example.com'),
       (7, 'Takács Katalin', 'Győr, Szent István tér 3.', '+36228889999', 'takacs.katalin@example.com'),
       (8, 'Molnár János', 'Kecskemét, Kossuth tér 1.', '+36337778888', 'molnar.janos@example.com'),
       (9, 'Farkas Gergő', 'Nyíregyháza, Bocskai u. 12.', '+36221112222', 'farkas.gergo@example.com'),
       (10, 'Németh Krisztina', 'Eger, Dobozi út 6.', '+36339998888', 'nemeth.krisztina@example.com'),
       (11, 'Balogh Gábor', 'Veszprém, Kossuth u. 9.', '+36224443333', 'balogh.gabor@example.com'),
       (12, 'Simon Anna', 'Békéscsaba, Szent István tér 4.', '+36336669999', 'simon.anna@example.com');

INSERT INTO Kolcsonzesek (kolcsonzes_ID, jarmu_ID, ugyfel_ID, kezdo_datum, vege_datum, visszahozott, osszesen_fizetendo)
VALUES (1, 2, 2, '2022-11-15', '2022-11-20', false, 28000),
       (2, 3, 8, '2022-11-18', '2022-11-23', true, 32000),
       (3, 6, 10, '2022-11-20', '2022-11-25', false, 40000),
       (4, 1, 3, '2022-11-22', '2022-11-27', true, 35000),
       (5, 4, 6, '2022-11-25', '2022-11-30', false, 38000),
       (6, 5, 7, '2022-11-28', '2022-12-03', true, 42000),
       (7, 2, 9, '2022-12-01', '2022-12-06', false, 36000),
       (8, 10, 12, '2022-12-04', '2022-12-09', true, 30000),
       (9, 6, 8, '2022-12-07', '2022-12-12', false, 48000),
       (10, 9, 5, '2022-12-10', '2022-12-15', true, 42000),
       (11, 6, 10, '2023-11-01', '2023-11-05', false, 26000);  

INSERT INTO Szamlak (szamla_ID, kolcsonzes_ID, kibocsatas_datum, hatarido, fizetett, osszeg)
VALUES (1, 1, '2022-11-05', '2022-11-15', false, 25000),
       (2, 2, '2022-11-02', '2022-11-12', true, 32000),
       (3, 3, '2022-11-04', '2022-11-14', false, 12000),
       (4, 4, '2022-11-10', '2022-11-20', true, 28000),
       (5, 5, '2022-11-15', '2022-11-25', false, 35000),
       (6, 6, '2022-11-18', '2022-11-28', true, 42000),
       (7, 7, '2022-11-22', '2022-12-02', false, 39000),
       (8, 8, '2022-11-27', '2022-12-07', true, 31000),
       (9, 9, '2022-12-01', '2022-12-11', false, 46000),
       (10, 10, '2022-12-05', '2022-12-15', true, 39000);

/*Indexek*/

CREATE INDEX Jarmuvek_Jarmu_idx ON Jarmuvek(jarmu_ID);

CREATE INDEX Ugyfelek_Ugyfel_idx ON Ugyfelek(ugyfel_ID);

CREATE INDEX Kolcsonzesek_Jarmu_idx ON Kolcsonzesek(jarmu_ID);

CREATE INDEX Kolcsonzesek_Ugyfel_idx ON Kolcsonzesek(ugyfel_ID);

CREATE INDEX Szamlak_Kolcsonzes_idx ON Szamlak(kolcsonzes_ID);

/*Jármű elérhetősége*/
SELECT jarmu_ID, tipus, marka, modell
FROM Jarmuvek
WHERE jarmu_ID NOT IN (
    SELECT jarmu_ID
    FROM Kolcsonzesek
    WHERE '2022-11-22' BETWEEN kezdo_datum AND vege_datum
);

/*Ügyyfelek kölcsönzési előzménye*/
SELECT Kolcsonzesek.kolcsonzes_ID, Jarmuvek.marka, Jarmuvek.modell, Kolcsonzesek.kezdo_datum, Kolcsonzesek.vege_datum, Kolcsonzesek.visszahozott, Szamlak.osszeg
FROM Kolcsonzesek
JOIN Jarmuvek ON Kolcsonzesek.jarmu_ID = Jarmuvek.jarmu_ID
LEFT JOIN Szamlak ON Kolcsonzesek.kolcsonzes_ID = Szamlak.kolcsonzes_ID
WHERE Kolcsonzesek.ugyfel_ID = 2;

/*Az összes kölcsönzés összegzése típusonként*/
SELECT Jarmuvek.tipus, SUM(Szamlak.osszeg) AS Teljes_bevetel
FROM Kolcsonzesek
JOIN Jarmuvek ON Kolcsonzesek.jarmu_ID = Jarmuvek.jarmu_ID
JOIN Szamlak ON Kolcsonzesek.kolcsonzes_ID = Szamlak.kolcsonzes_ID
GROUP BY Jarmuvek.tipus;

/*Ügyfelek száma, akik visszahozták a járműveket*/

SELECT COUNT(DISTINCT Kolcsonzesek.ugyfel_ID) AS Visszahozott_jarmuvek_szama
FROM Kolcsonzesek
WHERE Kolcsonzesek.visszahozott = true;

/*---------------------------------------*/

CREATE OR REPLACE FUNCTION jarmu_elerhetosegenek_frissitese()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.visszahozott = false THEN
        UPDATE Jarmuvek
        SET elerheto = false
        WHERE jarmu_ID = NEW.jarmu_ID;
    ELSE
        UPDATE Jarmuvek
        SET elerheto = true
        WHERE jarmu_ID = NEW.jarmu_ID;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER jarmu_elerhetosegenek_frissitese
AFTER INSERT ON Kolcsonzesek
FOR EACH ROW
EXECUTE FUNCTION jarmu_elerhetosegenek_frissitese();

/*---------------------------------------*/

CREATE OR REPLACE PROCEDURE SzamlaGeneralas(p_Kolcsonzes_ID INT)
AS $$
DECLARE
    v_Osszeg INT;
    v_Vege_datum DATE;
BEGIN
    SELECT osszesen_fizetendo, vege_datum
    INTO v_Osszeg, v_Vege_datum
    FROM Kolcsonzesek
    WHERE kolcsonzes_ID = p_Kolcsonzes_ID;

    INSERT INTO Szamlak (kolcsonzes_ID, kibocsatas_datum, hatarido, fizetett, osszeg)
    VALUES (p_Kolcsonzes_ID, CURRENT_DATE, v_Vege_datum + INTERVAL '7' DAY, 0, v_Osszeg);
END;
$$ LANGUAGE plpgsql;

/*---------------------------------------*/

CREATE OR REPLACE PROCEDURE StatisztikaGeneralas()
AS $$
BEGIN
    -- Kölcsönzések száma minden járműtípusra
    SELECT Jarmuvek.tipus, COUNT(Kolcsonzesek.kolcsonzes_ID) AS Kolcsonzesek_Szama
    FROM Jarmuvek
    LEFT JOIN Kolcsonzesek ON Jarmuvek.jarmu_ID = Kolcsonzesek.jarmu_ID
    GROUP BY Jarmuvek.tipus;

    -- Összes fizetett összeg ügyfelenként
    SELECT Ugyfelek.nev, SUM(Szamlak.osszeg) AS Osszes_Fizetett_Osszeg
    FROM Ugyfelek
    LEFT JOIN Kolcsonzesek ON Ugyfelek.ugyfel_ID = Kolcsonzesek.ugyfel_ID
    LEFT JOIN Szamlak ON Kolcsonzesek.kolcsonzes_ID = Szamlak.kolcsonzes_ID
    WHERE Szamlak.fizetett = 1
    GROUP BY Ugyfelek.nev;
END;
$$ LANGUAGE plpgsql;

/*Ügyfelek tábla particionálása*/

CREATE TABLE Ugyfelek_Particionalt (
    ugyfel_ID INT,
    nev VARCHAR(255),
    cim VARCHAR(255),
    telefonszam VARCHAR(20),
    email_cim VARCHAR(255),
    megye VARCHAR(50),
    PRIMARY KEY (ugyfel_ID, megye)
)
PARTITION BY LIST(megye);

CREATE TABLE U_P_BacsKiskun PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Bács-Kiskun megye');
CREATE TABLE U_P_Baranya PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Baranya megye');
CREATE TABLE U_P_Bekes PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Békés megye');
CREATE TABLE U_P_BorsodAbaujZemplen PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Borsod-Abaúj-Zemplén megye');
CREATE TABLE U_P_CsongradCsanad PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Csongrád-Csanád megye');
CREATE TABLE U_P_Fejer PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Fejér megye');
CREATE TABLE U_P_GyorMosonSopron PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Győr-Moson-Sopron megye');
CREATE TABLE U_P_HajduBihar PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Hajdú-Bihar megye');
CREATE TABLE U_P_Heves PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Heves megye');
CREATE TABLE U_P_JaszNagykunSzolnok PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Jász-Nagykun-Szolnok megye');
CREATE TABLE U_P_KomaromEsztergom PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Komárom-Esztergom megye');
CREATE TABLE U_P_Nograd PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Nógrád megye');
CREATE TABLE U_P_Pest PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Pest megye');
CREATE TABLE U_P_Somogy PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Somogy megye');
CREATE TABLE U_P_SzabolcsSzatmarBereg PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Szabolcs-Szatmár-Bereg megye');
CREATE TABLE U_P_Tolna PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Tolna megye');
CREATE TABLE U_P_Vas PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Vas megye');
CREATE TABLE U_P_Veszprem PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Veszprém megye');
CREATE TABLE U_P_Zala PARTITION OF Ugyfelek_Particionalt FOR VALUES IN ('Zala megye');