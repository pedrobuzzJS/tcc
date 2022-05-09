/*
  Warnings:

  - You are about to drop the column `estado` on the `tbbairro` table. All the data in the column will be lost.
  - You are about to drop the column `pais` on the `tbbairro` table. All the data in the column will be lost.
  - You are about to drop the column `cep` on the `tbendereco` table. All the data in the column will be lost.
  - Added the required column `nome` to the `tbcep` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numero` to the `tbendereco` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "tbbairro" DROP COLUMN "estado",
DROP COLUMN "pais";

-- AlterTable
ALTER TABLE "tbcep" ADD COLUMN     "nome" VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE "tbendereco" DROP COLUMN "cep",
ADD COLUMN     "numero" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "tbestado" ADD CONSTRAINT "tbestado_pais_fkey" FOREIGN KEY ("pais") REFERENCES "tbpais"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbcidade" ADD CONSTRAINT "tbcidade_pais_fkey" FOREIGN KEY ("pais") REFERENCES "tbpais"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbcidade" ADD CONSTRAINT "tbcidade_estado_fkey" FOREIGN KEY ("estado") REFERENCES "tbestado"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbbairro" ADD CONSTRAINT "tbbairro_cidade_fkey" FOREIGN KEY ("cidade") REFERENCES "tbcidade"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbcep" ADD CONSTRAINT "tbcep_pais_fkey" FOREIGN KEY ("pais") REFERENCES "tbpais"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbcep" ADD CONSTRAINT "tbcep_cidade_fkey" FOREIGN KEY ("cidade") REFERENCES "tbcidade"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbcep" ADD CONSTRAINT "tbcep_bairro_fkey" FOREIGN KEY ("bairro") REFERENCES "tbbairro"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbcep" ADD CONSTRAINT "tbcep_tipologradouro_fkey" FOREIGN KEY ("tipologradouro") REFERENCES "tbtipologradouro"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbcep" ADD CONSTRAINT "tbcep_estado_fkey" FOREIGN KEY ("estado") REFERENCES "tbendereco"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;
