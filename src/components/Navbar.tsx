import Link from "next/link";
import styles from "./Navbar.module.css";
import ActiveLink from './ActiveLink';

export default function Navbar() {
  return (
    <nav className={styles['main-navbar']}>
      <ActiveLink text="Home" href="/" style={styles.link} />
      <ActiveLink text="About" href="/about" style={styles.link} />
      <ActiveLink text="Contact" href="/contact" style={styles.link} />
    </nav>
  );
}