# Contrato Bomboniere

## Produto

- `id` pk,uuid, obrigatório
- `name` string, obrigatório
- `price` double, obrigatório
- `stock` int, obrigatório
- `status` string, obrigatório

## Ingrediente

- `name` string,obrigatório
- `unidadeMedida` double, obrigatório
- `id` PK, uuid, obrigatório
- `stock` int, obrigatório
- `recipes` [], obrigatório

## Receita

- `id` PK, uuid, obrigatório
- `description` string
- `name` string, obrigatório
- `status` string, obrigatório
- `ingredients` [], obrigatorio

## Cardapio

- `id` PK, uuid, obrigatório
- `name` string, obrigatório
- `status` string, obrigatório
- `dataCriacao` date, obrigatório
- `dataEncerramento` date, obrigatório
- `menuItems`[], obrigatorio

## Item de cardapio

- `nameItem` string, obrigatório
- `idMenu` FK, uuid, obrigatório
- `price` double, obrigatório
- `status` string, obrigatório
- `idProduct` FK, uuid, obrigatório | `idRecipe` FK, uuid, obrigatorio (ou um ou outro não pode haver os dois fks ao mesmo tempo)
- `menuList` [], obrigatorio

## Pedido

- `id` Pk, uuid, obrigatório
- `source` string, obrigatório
- `session` string, obrigatorio se a origem for cinema
- `seat` string, obrigatorio se a origem for cinema
- `userId` string, obrigatorio se a origem for app
- `dataCriacao` date, obrigatorio
- `status` string, obrigatório
  - `created` estado inicial, assim que a requisição foi feita
  - `preparing` pedido recebido pela cozinha e em preparo
  - `ready` pedido pronto para ser retirado(no caso de app ou caixa)
  - `delivered` pedido saiu para entrega(no caso do vip)
  - `cancelled` pedido cancelado
- `orderItems` [], obrigatorio

## Item do Pedido

- `id` PK, uuid, obrigatorio
- `idMenuItem` FK, uuid, obrigatorio
- `price` double, obrigatorio
- `name` string, obrigatorio
- `idPedido` FK, uuid, obrigatorio

## Exemplos de resposta

### Produto

    {
    id: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    name: "Refrigerante lata Coca-Cola 300ml",
    price: 5.00,
    stock: 10,
    status: "ativo" | "inativo"
    }

### Ingrediente:

    {
    id:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    name:"milho",
    unidadeMedida: "grama",
    stock:"2000",
    recipes: [
    	{
    		idRecipe:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    		idIngredients:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    		quantidade:"20"
    	},
    ]
    }

### Receita:

    {
    	id: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    	name:"Pipoca salgada grande",
    	status: "ativo" | "inativo",
    	price: 20.00,
    	ingredients: [
    		{
    			idRecipe: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    			idIngredients:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    			quantidade:"20"
    		}
    	]
    }

### menu:

    {
    id: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    name: "Cardápio promocional de natal",
    status: "ativo" | "inativo",
    dataEncerramento: "20/10/2026"
    menuItems: [
        {
            idIngredient:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            idMenuItem: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            price:35.00
        }
    ]
    }

### Item menu:

    {
    id: “d603bda9-a6aa-4ebe-bd72-51a900301b2d”,
    name:"Pipoca salgada grande",
    status: "ativo" | "inativo",
    idProduct:"d603bda9-a6aa-4ebe-bd72-51a900301b2d", //ou idRecipe, não pode ser os dois ao mesmo tempo
    menuList: [
        {
            idMenu: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            idMenuItem:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            price:35.00
        }
    ]
    }

### Pedido:

    {
    id: “d603bda9-a6aa-4ebe-bd72-51a900301b2d”,
    source: "caixa" | "app" | "cinema",
    session: "Homem-aranha 21:00 sala B",
    seat: "F21",
    userId: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    dataCriacao: 21/03/2026,
    status: "created" | "preparing" | "ready" | "delivered" | "cancelled",
    orderItems: [
        {
            orderItem:"d603bda9-a6aa-4ebe-bd72-51a900301b2d"
        }
    ]
    }

## Item do Pedido

{
id:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
idMenuItem: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
price: 35.00,
name: "Pipoca grande salgada",
orderId:"d603bda9-a6aa-4ebe-bd72-51a900301b2d"
}
