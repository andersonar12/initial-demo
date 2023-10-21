"use client";

import Link from "next/link";
import styles from "./ActiveLink.module.css";

import { usePathname } from "next/navigation";
import { useEffect } from "react";
export default function ActiveLink({ text, href, style }: any) {
  const pathname = usePathname();
  const isActive = pathname === href;

  return (
    <Link href={href} className={`${style} ${isActive ? styles["active-link"] : ''}`}>
      {text}
    </Link>
  );
}
