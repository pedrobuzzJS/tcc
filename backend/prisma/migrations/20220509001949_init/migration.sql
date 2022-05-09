-- DropForeignKey
ALTER TABLE "tbusuariorotina" DROP CONSTRAINT "tbusuariorotina_rotina_fkey";

-- DropForeignKey
ALTER TABLE "tbusuariorotina" DROP CONSTRAINT "tbusuariorotina_usuario_fkey";

-- AddForeignKey
ALTER TABLE "tbusuariorotina" ADD CONSTRAINT "tbusuariorotina_usuario_fkey" FOREIGN KEY ("usuario") REFERENCES "tbusuario"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbusuariorotina" ADD CONSTRAINT "tbusuariorotina_rotina_fkey" FOREIGN KEY ("rotina") REFERENCES "tbrotina"("codigo") ON DELETE RESTRICT ON UPDATE CASCADE;
