-- CreateTable
CREATE TABLE "Ingredient" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "unidademedida" DOUBLE PRECISION NOT NULL,
    "stock" INTEGER NOT NULL,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Ingredient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecipeIngredient" (
    "idRecipe" TEXT NOT NULL,
    "idIngredient" TEXT NOT NULL,
    "quantity" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "RecipeIngredient_pkey" PRIMARY KEY ("idRecipe","idIngredient")
);

-- CreateTable
CREATE TABLE "Recipe" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "status" TEXT NOT NULL,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Recipe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Menu" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "datacriacao" TIMESTAMP(3) NOT NULL,
    "dataencerramento" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Menu_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "itemMenu" (
    "id" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "idProduto" TEXT,
    "idRecipe" TEXT,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "itemMenu_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MenuitemMenu" (
    "idMenu" TEXT NOT NULL,
    "idItemMenu" TEXT NOT NULL,

    CONSTRAINT "MenuitemMenu_pkey" PRIMARY KEY ("idMenu","idItemMenu")
);

-- CreateTable
CREATE TABLE "ProdutoitemMenu" (
    "idProduto" TEXT,
    "idItemMenu" TEXT NOT NULL,

    CONSTRAINT "ProdutoitemMenu_pkey" PRIMARY KEY ("idItemMenu")
);

-- CreateTable
CREATE TABLE "RecipeitemMenu" (
    "idRecipe" TEXT,
    "idItemMenu" TEXT NOT NULL,

    CONSTRAINT "RecipeitemMenu_pkey" PRIMARY KEY ("idItemMenu")
);

-- AddForeignKey
ALTER TABLE "RecipeIngredient" ADD CONSTRAINT "RecipeIngredient_idRecipe_fkey" FOREIGN KEY ("idRecipe") REFERENCES "Recipe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecipeIngredient" ADD CONSTRAINT "RecipeIngredient_idIngredient_fkey" FOREIGN KEY ("idIngredient") REFERENCES "Ingredient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "itemMenu" ADD CONSTRAINT "itemMenu_idProduto_fkey" FOREIGN KEY ("idProduto") REFERENCES "Produto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "itemMenu" ADD CONSTRAINT "itemMenu_idRecipe_fkey" FOREIGN KEY ("idRecipe") REFERENCES "Recipe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MenuitemMenu" ADD CONSTRAINT "MenuitemMenu_idMenu_fkey" FOREIGN KEY ("idMenu") REFERENCES "Menu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MenuitemMenu" ADD CONSTRAINT "MenuitemMenu_idItemMenu_fkey" FOREIGN KEY ("idItemMenu") REFERENCES "itemMenu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProdutoitemMenu" ADD CONSTRAINT "ProdutoitemMenu_idProduto_fkey" FOREIGN KEY ("idProduto") REFERENCES "Produto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProdutoitemMenu" ADD CONSTRAINT "ProdutoitemMenu_idItemMenu_fkey" FOREIGN KEY ("idItemMenu") REFERENCES "itemMenu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecipeitemMenu" ADD CONSTRAINT "RecipeitemMenu_idRecipe_fkey" FOREIGN KEY ("idRecipe") REFERENCES "Recipe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecipeitemMenu" ADD CONSTRAINT "RecipeitemMenu_idItemMenu_fkey" FOREIGN KEY ("idItemMenu") REFERENCES "itemMenu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
