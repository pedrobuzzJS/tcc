-- CreateTable
CREATE TABLE "tbpais" (
    "codigo" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "sigla" VARCHAR(3) NOT NULL,
    "ddi" VARCHAR(3) NOT NULL,

    CONSTRAINT "tbpais_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbcidade" (
    "codigo" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "pais" INTEGER NOT NULL,
    "estado" INTEGER NOT NULL,
    "ibge" VARCHAR(10) NOT NULL,

    CONSTRAINT "tbcidade_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbestado" (
    "codigo" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "pais" INTEGER NOT NULL,
    "sigla" VARCHAR(3) NOT NULL,
    "ibge" VARCHAR(5) NOT NULL,

    CONSTRAINT "tbestado_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbbairro" (
    "codigo" SERIAL NOT NULL,
    "nome" VARCHAR(150) NOT NULL,
    "pais" INTEGER NOT NULL,
    "estado" INTEGER NOT NULL,
    "cidade" INTEGER NOT NULL,

    CONSTRAINT "tbbairro_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbtipologradouro" (
    "codigo" SERIAL NOT NULL,
    "sigla" VARCHAR(10) NOT NULL,
    "nome" VARCHAR(50) NOT NULL,

    CONSTRAINT "tbtipologradouro_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbendereco" (
    "codigo" SERIAL NOT NULL,
    "descricao" VARCHAR(255) NOT NULL,
    "complemento" VARCHAR(255) NOT NULL,
    "cep" INTEGER NOT NULL,
    "residencial" BOOLEAN NOT NULL DEFAULT false,
    "comercial" BOOLEAN NOT NULL DEFAULT false,
    "fiscal" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "tbendereco_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbcep" (
    "codigo" SERIAL NOT NULL,
    "tipologradouro" INTEGER NOT NULL,
    "pais" INTEGER NOT NULL,
    "estado" INTEGER NOT NULL,
    "cidade" INTEGER NOT NULL,
    "bairro" INTEGER NOT NULL,
    "cep" VARCHAR(9) NOT NULL,

    CONSTRAINT "tbcep_pkey" PRIMARY KEY ("codigo")
);
