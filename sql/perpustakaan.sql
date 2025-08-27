CREATE TABLE Categories (
    id serial PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Members (
    id serial PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Librarians (
    id serial PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Bookshelves (
    id serial PRIMARY KEY,
    code VARCHAR(100) UNIQUE NOT NULL,
    category_id int REFERENCES public.Categories (id)
);

CREATE TABLE Books (
    id serial PRIMARY KEY,
    title VARCHAR(150) UNIQUE NOT NULL,
    autor VARCHAR(100) UNIQUE NOT NULL,
    category_id int REFERENCES public.Categories (id),
    bookshelve_id int REFERENCES public.Bookshelves (id)
);

CREATE TABLE Borrowing (
    id serial PRIMARY KEY,
    book_id int REFERENCES public.Books (id),
    member_id int REFERENCES public.Members (id),
    librarian_id int REFERENCES public.Librarians (id)
);

INSERT INTO Categories (name) VALUES
('fiksi'),
('non-fiksi'),
('ilmiah'),
('novel'),
('sejarah'),
('sains'),
('teknologi'),
('ekonomi dan bisnis'),
('hukum'),
('buku anak');

INSERT INTO Members (name) VALUES
('andi'),
('budi'),
('putri'),
('putra'),
('indah'),
('bagus'),
('indira'),
('nuna'),
('aca'),
('ata');

INSERT INTO Librarians (name) VALUES
('rani'),
('doni'),
('fani'),
('galih'),
('hisam'),
('jono'),
('asep'),
('sani'),
('diva'),
('dava');

INSERT INTO Bookshelves (code, category_id) VALUES
('1001', '10'),
('1020', '7'),
('1122', '4'),
('1501', '9'),
('1010', '1'),
('1750', '3'),
('1004', '8'),
('1070', '2'),
('1300', '5'),
('1601', '6');

INSERT INTO Books (title, autor, category_id, bookshelve_id) VALUES
('Laskar Pelangi', 'Andrea Hirata', 4, 1),
('Sapiens: Riwayat Singkat Umat Manusia', 'Yuval Noah Harari', 3, 2),
('The Great Gatsby', 'F. Scott Fitzgerald', 1, 3),
('Sejarah Peradaban Dunia', 'Herlina P. Dewi', 5, 4),
('Fisika Dasar', 'Paul Hewitt', 6, 5), 
('The Age of Intelligent Machines', 'Ray Kurzweil', 7, 6),
('Ekonomi Mikro Modern', 'N. Gregory Mankiw', 8, 7),
('Hukum Pidana Indonesia', 'Moeljatno', 9, 8), 
('Kumpulan Dongeng Nusantara', 'Riawani Elyta', 10, 9),
('Bumi', 'Tere Liye', 4, 10); 

INSERT INTO Borrowing (book_id, member_id, librarian_id) VALUES
(3, 7, 2),
(1, 4, 9),
(8, 2, 5),
(5, 9, 1),
(10, 6, 3),
(2, 1, 7),
(7, 10, 4),
(4, 3, 8),
(9, 5, 6),
(6, 8, 10);