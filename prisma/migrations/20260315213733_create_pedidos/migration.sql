-- CreateTable
CREATE TABLE "Pedido" (
    "id" TEXT NOT NULL,
    "source" TEXT NOT NULL,
    "session" TEXT,
    "seat" TEXT,
    "userId" TEXT,
    "dataCriacao" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'created',
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pedido_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PedidoItemPedido" (
    "idPedido" TEXT NOT NULL,
    "idItemMenu" TEXT NOT NULL,

    CONSTRAINT "PedidoItemPedido_pkey" PRIMARY KEY ("idPedido","idItemMenu")
);

-- CreateTable
CREATE TABLE "itemPedido" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "idItemMenu" TEXT NOT NULL,
    "idPedido" TEXT NOT NULL,
    "CreatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "itemPedido_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "PedidoItemPedido" ADD CONSTRAINT "PedidoItemPedido_idPedido_fkey" FOREIGN KEY ("idPedido") REFERENCES "Pedido"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PedidoItemPedido" ADD CONSTRAINT "PedidoItemPedido_idItemMenu_fkey" FOREIGN KEY ("idItemMenu") REFERENCES "itemMenu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "itemPedido" ADD CONSTRAINT "itemPedido_idItemMenu_fkey" FOREIGN KEY ("idItemMenu") REFERENCES "itemMenu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "itemPedido" ADD CONSTRAINT "itemPedido_idPedido_fkey" FOREIGN KEY ("idPedido") REFERENCES "Pedido"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
