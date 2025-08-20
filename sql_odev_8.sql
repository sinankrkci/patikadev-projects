-- PostgreSQL script to create and populate `employee`, then perform UPDATE and DELETE operations
BEGIN;
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    birthday DATE,
    email VARCHAR(100)
);
INSERT INTO employee (id, name, birthday, email) VALUES
  (1, 'Ahmet Yılmaz', '2003-09-07', 'ahmet.yilmaz@example.com'),
  (2, 'Mehmet Kaya', '1976-02-14', 'mehmet.kaya@company.org'),
  (3, 'Ayşe Demir', '1985-12-26', 'ayse.demir@mail.com'),
  (4, 'Fatma Şahin', '1981-04-05', 'fatma.sahin@example.com'),
  (5, 'Ali Çelik', '2005-05-10', 'ali.celik@demo.net'),
  (6, 'Veli Yıldız', '1978-11-25', 'veli.yildiz@demo.net'),
  (7, 'Zeynep Yıldırım', '1993-12-04', 'zeynep.yildirim@example.com'),
  (8, 'Emre Aydın', '1976-05-03', 'emre.aydin@example.com'),
  (9, 'Can Öztürk', '1984-10-22', 'can.ozturk@mail.com'),
  (10, 'Deniz Aslan', '1997-09-01', 'deniz.aslan@demo.net'),
  (11, 'Hakan Ay', '1976-03-10', 'hakan.ay@demo.net'),
  (12, 'Burak Arslan', '1983-12-02', 'burak.arslan@demo.net'),
  (13, 'Elif Doğan', '1993-10-26', 'elif.dogan@mail.com'),
  (14, 'Ece Kılıç', '1995-02-24', 'ece.kilic@demo.net'),
  (15, 'Merve Kara', '1987-06-24', 'merve.kara@example.com'),
  (16, 'Seda Koç', '1982-02-28', 'seda.koc@corp.co'),
  (17, 'Berk Kurt', '1990-04-06', 'berk.kurt@company.org'),
  (18, 'Selin Özdemir', '1981-12-22', 'selin.ozdemir@mail.com'),
  (19, 'Gizem Ateş', '1990-02-05', 'gizem.ates@example.com'),
  (20, 'Cem Işık', '1979-02-28', 'cem.isik@corp.co'),
  (21, 'Eren Polat', '1979-05-04', 'eren.polat@company.org'),
  (22, 'Pelin Uzun', '1990-06-06', 'pelin.uzun@demo.net'),
  (23, 'Nil Kaplan', '1986-11-12', 'nil.kaplan@example.com'),
  (24, 'Arda Sarı', '1995-08-11', 'arda.sari@demo.net'),
  (25, 'Kerem Tekin', '1980-08-07', 'kerem.tekin@corp.co'),
  (26, 'Kaan Taş', '1978-07-15', 'kaan.tas@demo.net'),
  (27, 'Derya Aksoy', '1988-02-25', 'derya.aksoy@demo.net'),
  (28, 'Sinem Baran', '1991-03-23', 'sinem.baran@demo.net'),
  (29, 'Aslı Dinç', '1983-08-17', 'asli.dinc@example.com'),
  (30, 'Gökhan Ekinci', '1977-01-20', 'gokhan.ekinci@mail.com'),
  (31, 'İrem Güneş', '1987-12-25', 'irem.gunes@example.com'),
  (32, 'Cansu Bulut', '1985-06-11', 'cansu.bulut@example.com'),
  (33, 'Buse Çetin', '1992-01-19', 'buse.cetin@company.org'),
  (34, 'Onur Er', '1995-05-04', 'onur.er@company.org'),
  (35, 'Yasin Erkan', '1982-04-18', 'yasin.erkan@company.org'),
  (36, 'Sude Güler', '1990-12-08', 'sude.guler@mail.com'),
  (37, 'Tunç Yavuz', '2005-01-23', 'tunc.yavuz@company.org'),
  (38, 'Sarp Keskin', '2005-08-30', 'sarp.keskin@example.com'),
  (39, 'Yasemin Avcı', '2002-04-29', 'yasemin.avci@mail.com'),
  (40, 'Naz Can', '1998-12-17', 'naz.can@mail.com'),
  (41, 'Özgür Karadağ', '1982-05-01', 'ozgur.karadag@corp.co'),
  (42, 'Gül Korkmaz', '1992-01-08', 'gul.korkmaz@company.org'),
  (43, 'Hale Özkan', '2003-09-16', 'hale.ozkan@demo.net'),
  (44, 'Sevgi Sezer', '1984-11-07', 'sevgi.sezer@company.org'),
  (45, 'Tuna Turan', '1977-07-05', 'tuna.turan@mail.com'),
  (46, 'Eda Uçar', '1976-06-09', 'eda.ucar@company.org'),
  (47, 'Umut Vural', '1992-12-29', 'umut.vural@company.org'),
  (48, 'Baran Yaman', '1977-12-20', 'baran.yaman@mail.com'),
  (49, 'Sibel Zengin', '2000-06-10', 'sibel.zengin@company.org'),
  (50, 'Rana Bozkurt', '1984-07-15', 'rana.bozkurt@corp.co');

-- UPDATE #1: Belirli bir ID aralığındaki çalışanların email domainini 'example.com' yapalım
UPDATE employee SET email = split_part(email, '@', 1) || '@example.com' WHERE id BETWEEN 10 AND 15;

-- UPDATE #2: İsmi 'A' ile başlayanların adını büyük harfe çevirelim
UPDATE employee SET name = UPPER(name) WHERE name ILIKE 'a%';

-- UPDATE #3: 1990 öncesi doğumluların email'ine '+legacy' etiketi ekleyelim
UPDATE employee SET email = split_part(email, '@', 1) || '+legacy@' || split_part(email, '@', 2) WHERE birthday < DATE '1990-01-01';

-- UPDATE #4: '@corp.co' domainine sahip olanların doğum gününü 1 gün ileri alalım
UPDATE employee SET birthday = birthday + INTERVAL '1 day' WHERE email ILIKE '%@corp.co';

-- UPDATE #5: Soyadı 'Yılmaz' olanların isimlerini Title Case yapalım
UPDATE employee SET name = INITCAP(name) WHERE name ~* ' yilmaz$';

-- DELETE #1: ID'si 5'in katı olan kayıtları sil
DELETE FROM employee WHERE id % 5 = 0;

-- DELETE #2: İsmi 'Z' ile başlayanları sil
DELETE FROM employee WHERE name ILIKE 'z%';

-- DELETE #3: 2000 ve sonrası doğumlulardan 'mail.com' domainine sahip olanları sil
DELETE FROM employee WHERE birthday >= DATE '2000-01-01' AND email ILIKE '%@mail.com';

-- DELETE #4: Email kullanıcı adı 20 karakterden uzun olanları sil
DELETE FROM employee WHERE length(split_part(email, '@', 1)) > 20;

-- DELETE #5: '@demo.net' domainine sahip olanlardan ID'si tek olanları sil
DELETE FROM employee WHERE email ILIKE '%@demo.net' AND (id % 2) = 1;

COMMIT;