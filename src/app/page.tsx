import Link from "next/link"

export default function Home() {
  return (
    <section>
      <h1>Home</h1>
      <Link href="/about">Ir al ABOUT</Link>
    </section>
  )
}
