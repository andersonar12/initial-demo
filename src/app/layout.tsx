import type { Metadata } from "next";
import "./globals.css";
import Navbar from '../components/Navbar';

export const metadata: Metadata = {
  title: "App Practice",
  description: "Made By Anderson Romero",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>
        <Navbar></Navbar>
        {children}
        </body>
    </html>
  );
}
