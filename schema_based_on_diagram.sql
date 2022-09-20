-- patients table
CREATE TABLE patients
(
    id            INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    name          VARCHAR(50)                      NOT NULL,
    date_of_birth DATE
);

-- medical histories table
CREATE TABLE medical_histories
(
    id          INT GENERATED ALWAYS AS IDENTITY               NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP                                      NOT NULL,
    patient_id  INT REFERENCES patients (id) ON DELETE CASCADE NOT NULL,
    status      VARCHAR(20)                                    NOT NULL

);

-- treatments table
CREATE TABLE treatments
(
    id   INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    type VARCHAR(50)                      NOT NULL,
    name VARCHAR(50)                      NOT NULL
);

-- invoices table
CREATE TABLE invoices
(
    id                 INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    total_amount       DECIMAL(10, 2)                   NOT NULL,
    generated_at       TIMESTAMP                        NOT NULL,
    payed_at           TIMESTAMP,
    medical_history_id INT
);

-- invoice_items table
CREATE TABLE invoices_items
(
    id           INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    unit_price   DECIMAL,
    quantity     INT,
    total_price  DECIMAL,
    invoice_id   INT REFERENCES invoices (id) ON DELETE CASCADE,
    treatment_id INT REFERENCES treatments (id) ON DELETE CASCADE
);
-- table created from a many to many relationships between medical_histories and treatments
CREATE TABLE medical_histories_treatments
(
    id                 INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    medical_history_id INT REFERENCES medical_histories (id) ON DELETE CASCADE,
    treatment_id       INT REFERENCES treatments (id) ON DELETE CASCADE
)

