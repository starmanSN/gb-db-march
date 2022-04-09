CREATE TABLE MANUFACTURER
(
    ID   BIGSERIAL    NOT NULL PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,

    UNIQUE (NAME)
);

CREATE TABLE PRODUCT
(
    ID               BIGSERIAL      NOT NULL PRIMARY KEY,
    TITLE            VARCHAR(255)   NOT NULL,
    COST             DECIMAL(10, 2) NOT NULL,
    MANUFACTURE_DATE DATE           NOT NULL,
    MANUFACTURER_ID  BIGINT,

    UNIQUE (TITLE),

    CONSTRAINT fk_manufacturer
        FOREIGN KEY (MANUFACTURER_ID)
            REFERENCES MANUFACTURER (ID)
);

SELECT name, p.id as product_id, title, cost, MANUFACTURE_DATE, MANUFACTURER_ID
FROM MANUFACTURER m
         INNER JOIN PRODUCT p on m.ID = p.MANUFACTURER_ID
WHERE m.id = 3;