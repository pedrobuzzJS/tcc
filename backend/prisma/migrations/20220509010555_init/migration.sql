/*
  Warnings:

  - You are about to drop the `tbrotina` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tbrotinapermissao` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tbusuariorotina` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "tbrotinapermissao" DROP CONSTRAINT "tbrotinapermissao_permissao_fkey";

-- DropForeignKey
ALTER TABLE "tbrotinapermissao" DROP CONSTRAINT "tbrotinapermissao_rotina_fkey";

-- DropForeignKey
ALTER TABLE "tbusuariorotina" DROP CONSTRAINT "tbusuariorotina_rotina_fkey";

-- DropForeignKey
ALTER TABLE "tbusuariorotina" DROP CONSTRAINT "tbusuariorotina_usuario_fkey";

-- DropTable
DROP TABLE "tbrotina";

-- DropTable
DROP TABLE "tbrotinapermissao";

-- DropTable
DROP TABLE "tbusuariorotina";

-- CreateTable
CREATE TABLE "tbgrupo" (
    "codigo" SERIAL NOT NULL,
    "descricao" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tbgrupo_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "tbusuariogrupo" (
    "grupo" INTEGER NOT NULL,
    "usuario" INTEGER NOT NULL,

    CONSTRAINT "tbusuariogrupo_pkey" PRIMARY KEY ("grupo","usuario")
);

-- CreateTable
CREATE TABLE "tbgrupopermissao" (
    "grupo" INTEGER NOT NULL,
    "permissao" INTEGER NOT NULL,

    CONSTRAINT "tbgrupopermissao_pkey" PRIMARY KEY ("grupo","permissao")
);

-- AddForeignKey
ALTER TABLE "tbusuariogrupo" ADD CONSTRAINT "tbusuariogrupo_usuario_fkey" FOREIGN KEY ("usuario") REFERENCES "tbusuario"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbusuariogrupo" ADD CONSTRAINT "tbusuariogrupo_grupo_fkey" FOREIGN KEY ("grupo") REFERENCES "tbgrupo"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbgrupopermissao" ADD CONSTRAINT "tbgrupopermissao_grupo_fkey" FOREIGN KEY ("grupo") REFERENCES "tbgrupo"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbgrupopermissao" ADD CONSTRAINT "tbgrupopermissao_permissao_fkey" FOREIGN KEY ("permissao") REFERENCES "tbpermissao"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;
