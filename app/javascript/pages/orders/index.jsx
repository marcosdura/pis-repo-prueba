import { Head, router, usePage } from "@inertiajs/react"
import { useState } from "react"

export default function OrdersIndex({ orders, meals }) {
  const { errors } = usePage().props

  const [form, setForm] = useState({
    meal_id: "",
    employee_name: "",
    delivery_date: "",
  })

  function handleChange(event) {
    const { name, value } = event.target

    setForm({
      ...form,
      [name]: value,
    })
  }

  function handleSubmit(event) {
    event.preventDefault()

    router.post(
      "/orders",
      {
        order: form,
      },
      {
        onSuccess: () => {
          setForm({
            meal_id: "",
            employee_name: "",
            delivery_date: "",
          })
        },
      }
    )
  }

  return (
    <>
      <Head title="Pedidos" />

      <main>
        <h1>Pedidos - GoGrow</h1>

        <h2>Nuevo pedido</h2>

        <form onSubmit={handleSubmit}>
          <div>
            <label htmlFor="meal_id">Plato</label>

            <select
              id="meal_id"
              name="meal_id"
              value={form.meal_id}
              onChange={handleChange}
            >
              <option value="">Seleccione un plato</option>

              {meals.map((meal) => (
                <option key={meal.id} value={meal.id}>
                  {meal.name} - ${meal.price}
                </option>
              ))}
            </select>

            {errors.meal && <p>{errors.meal}</p>}
          </div>

          <div>
            <label htmlFor="employee_name">Empleado</label>

            <input
              id="employee_name"
              name="employee_name"
              type="text"
              value={form.employee_name}
              onChange={handleChange}
            />

            {errors.employee_name && (
              <p>{errors.employee_name}</p>
            )}
          </div>

          <div>
            <label htmlFor="delivery_date">Fecha de entrega</label>

            <input
              id="delivery_date"
              name="delivery_date"
              type="date"
              value={form.delivery_date}
              onChange={handleChange}
            />

            {errors.delivery_date && (
              <p>{errors.delivery_date}</p>
            )}
          </div>

          <button type="submit">
            Crear pedido
          </button>
        </form>

        <hr />

        <h2>Pedidos existentes</h2>

        {orders.length === 0 ? (
          <p>No hay pedidos.</p>
        ) : (
          <ul>
            {orders.map((order) => (
              <li key={order.id}>
                <h3>{order.meal.name}</h3>

                <p>Empleado: {order.employee_name}</p>
                <p>Fecha: {order.delivery_date}</p>
                <p>Estado: {order.status}</p>
                <p>Precio: ${order.meal.price}</p>
                
                {order.status === "pending" && (
                  <button
                    type="button"
                    onClick={() => router.patch(`/orders/${order.id}/cancel`)}
                  >
                    Cancelar
                  </button>
                )}

                <hr />
              </li>
            ))}
          </ul>
        )}
      </main>
    </>
  )
}