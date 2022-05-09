-- CreateTable
CREATE TABLE "tbusuario" (
    "codigo" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "login" VARCHAR(100) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "senha" VARCHAR(255) NOT NULL,
    "confirmasenha" BOOLEAN NOT NULL,
    "confirmaemail" BOOLEAN NOT NULL DEFAULT false,
    "alterarsenha" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "tbusuario_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbrotina" (
    "codigo" SERIAL NOT NULL,
    "descricao" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tbrotina_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbpermissao" (
    "codigo" SERIAL NOT NULL,
    "nome" VARCHAR(50) NOT NULL,
    "descricao" VARCHAR(255) NOT NULL,

    CONSTRAINT "tbpermissao_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbusuariopermissao" (
    "usuario" INTEGER NOT NULL,
    "permissao" INTEGER NOT NULL,

    CONSTRAINT "tbusuariopermissao_pkey" PRIMARY KEY ("usuario","permissao")
);

-- CreateTable
CREATE TABLE "tbusuariorotina" (
    "rotina" INTEGER NOT NULL,
    "usuario" INTEGER NOT NULL,

    CONSTRAINT "tbusuariorotina_pkey" PRIMARY KEY ("rotina","usuario")
);

-- CreateTable
CREATE TABLE "tbrotinapermissao" (
    "rotina" INTEGER NOT NULL,
    "permissao" INTEGER NOT NULL,

    CONSTRAINT "tbrotinapermissao_pkey" PRIMARY KEY ("rotina","permissao")
);

-- AddForeignKey
ALTER TABLE "tbusuariopermissao" ADD CONSTRAINT "tbusuariopermissao_usuario_fkey" FOREIGN KEY ("usuario") REFERENCES "tbusuario"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbusuariopermissao" ADD CONSTRAINT "tbusuariopermissao_permissao_fkey" FOREIGN KEY ("permissao") REFERENCES "tbpermissao"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbusuariorotina" ADD CONSTRAINT "tbusuariorotina_rotina_fkey" FOREIGN KEY ("rotina") REFERENCES "tbusuario"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbusuariorotina" ADD CONSTRAINT "tbusuariorotina_usuario_fkey" FOREIGN KEY ("usuario") REFERENCES "tbrotina"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbrotinapermissao" ADD CONSTRAINT "tbrotinapermissao_rotina_fkey" FOREIGN KEY ("rotina") REFERENCES "tbrotina"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbrotinapermissao" ADD CONSTRAINT "tbrotinapermissao_permissao_fkey" FOREIGN KEY ("permissao") REFERENCES "tbpermissao"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;
