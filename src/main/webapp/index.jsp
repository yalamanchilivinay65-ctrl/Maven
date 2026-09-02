
import React, { useEffect, useMemo, useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  Search,
  ShoppingBag,
  Heart,
  Menu,
  X,
  ArrowRight,
  Star,
  Smartphone,
  Laptop,
  Shirt,
  Headphones,
  Footprints,
  Watch,
  Minus,
  Plus,
  Trash2,
  ShieldCheck,
  Truck,
  RotateCcw,
  Sparkles,
  ChevronRight,
  Check,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";

const categories = [
  { id: "all", name: "All products", icon: Sparkles },
  { id: "phones", name: "Smartphones", icon: Smartphone },
  { id: "laptops", name: "Laptops", icon: Laptop },
  { id: "clothing", name: "Clothing", icon: Shirt },
  { id: "gadgets", name: "Gadgets", icon: Headphones },
  { id: "footwear", name: "Footwear", icon: Footprints },
  { id: "accessories", name: "Accessories", icon: Watch },
];

const products = [
  {
    id: 1,
    title: "iPhone 14 Pro Max",
    price: 1099,
    oldPrice: 1199,
    rating: 4.9,
    reviews: 128,
    badge: "New",
    category: "phones",
    image: "https://images.unsplash.com/photo-1695048133142-1a20484d2569?auto=format&fit=crop&w=900&q=85",
    accent: "from-sky-100 to-blue-50",
  },
  {
    id: 2,
    title: "MacBook Pro 14",
    price: 1999,
    oldPrice: 2199,
    rating: 4.8,
    reviews: 86,
    badge: "Popular",
    category: "laptops",
    image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=900&q=85",
    accent: "from-slate-100 to-zinc-50",
  },
  {
    id: 3,
    title: "Apple Watch Series 8",
    price: 349,
    oldPrice: 399,
    rating: 4.9,
    reviews: 214,
    badge: "-13%",
    category: "accessories",
    image: "https://images.unsplash.com/photo-1546868871-7041f2a55e12?auto=format&fit=crop&w=900&q=85",
    accent: "from-violet-100 to-fuchsia-50",
  },
  {
    id: 4,
    title: "Nike Air Max 270",
    price: 150,
    oldPrice: 180,
    rating: 4.7,
    reviews: 53,
    badge: "Trending",
    category: "footwear",
    image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=900&q=85",
    accent: "from-rose-100 to-orange-50",
  },
  {
    id: 5,
    title: "Sony Alpha Camera",
    price: 2499,
    oldPrice: null,
    rating: 4.9,
    reviews: 42,
    badge: "Pro pick",
    category: "gadgets",
    image: "https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=900&q=85",
    accent: "from-stone-100 to-neutral-50",
  },
  {
    id: 6,
    title: "Signature Eau de Parfum",
    price: 120,
    oldPrice: 145,
    rating: 4.8,
    reviews: 189,
    badge: "Limited",
    category: "accessories",
    image: "https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&w=900&q=85",
    accent: "from-amber-100 to-yellow-50",
  },
  {
    id: 7,
    title: "Urban Travel Backpack",
    price: 79,
    oldPrice: 99,
    rating: 4.6,
    reviews: 67,
    badge: "-20%",
    category: "accessories",
    image: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=900&q=85",
    accent: "from-emerald-100 to-teal-50",
  },
  {
    id: 8,
    title: "Sony WH-1000XM5",
    price: 399,
    oldPrice: 449,
    rating: 4.9,
    reviews: 156,
    badge: "Best seller",
    category: "gadgets",
    image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=900&q=85",
    accent: "from-cyan-100 to-sky-50",
  },
  {
    id: 9,
    title: "Minimal Everyday Jacket",
    price: 139,
    oldPrice: 169,
    rating: 4.7,
    reviews: 91,
    badge: "New season",
    category: "clothing",
    image: "https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&w=900&q=85",
    accent: "from-orange-100 to-amber-50",
  },
];

const testimonials = [
  {
    name: "Ava Martin",
    role: "Verified buyer",
    quote: "Beautiful design, quick delivery, and the product quality exceeded my expectations.",
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=120&q=80",
  },
  {
    name: "Michael Lee",
    role: "Frequent buyer",
    quote: "The shopping experience feels effortless. Search, checkout, and delivery updates were all smooth.",
    avatar: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=120&q=80",
  },
  {
    name: "Sophia Carter",
    role: "Verified buyer",
    quote: "A thoughtfully curated catalog with excellent customer care. I will definitely shop again.",
    avatar: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=120&q=80",
  },
];

const money = (value) =>
  new Intl.NumberFormat("en-US", { style: "currency", currency: "USD", maximumFractionDigits: 0 }).format(value);

function Badge({ children, dark = false }) {
  return (
    <span className={`inline-flex items-center rounded-full px-3 py-1 text-xs font-semibold ${dark ? "bg-slate-950 text-white" : "bg-white/90 text-slate-900 shadow-sm backdrop-blur"}`}>
      {children}
    </span>
  );
}

export default function NexusShop() {
  const [menuOpen, setMenuOpen] = useState(false);
  const [cartOpen, setCartOpen] = useState(false);
  const [query, setQuery] = useState("");
  const [activeCategory, setActiveCategory] = useState("all");
  const [wishlist, setWishlist] = useState([]);
  const [cart, setCart] = useState([]);
  const [toast, setToast] = useState("");
  const [email, setEmail] = useState("");
  const [subscribed, setSubscribed] = useState(false);
  const [countdown, setCountdown] = useState({ days: 1, hours: 8, minutes: 24, seconds: 36 });

  useEffect(() => {
    const finish = Date.now() + (((1 * 24 + 8) * 60 + 24) * 60 + 36) * 1000;
    const timer = setInterval(() => {
      const distance = Math.max(0, finish - Date.now());
      setCountdown({
        days: Math.floor(distance / 86400000),
        hours: Math.floor((distance % 86400000) / 3600000),
        minutes: Math.floor((distance % 3600000) / 60000),
        seconds: Math.floor((distance % 60000) / 1000),
      });
    }, 1000);
    return () => clearInterval(timer);
  }, []);

  useEffect(() => {
    if (!toast) return;
    const timer = setTimeout(() => setToast(""), 2200);
    return () => clearTimeout(timer);
  }, [toast]);

  const filteredProducts = useMemo(() => {
    const value = query.trim().toLowerCase();
    return products.filter((product) => {
      const matchesCategory = activeCategory === "all" || product.category === activeCategory;
      const matchesQuery = !value || product.title.toLowerCase().includes(value) || product.category.toLowerCase().includes(value);
      return matchesCategory && matchesQuery;
    });
  }, [activeCategory, query]);

  const cartCount = cart.reduce((sum, item) => sum + item.quantity, 0);
  const subtotal = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);

  const addToCart = (product) => {
    setCart((current) => {
      const existing = current.find((item) => item.id === product.id);
      if (existing) return current.map((item) => item.id === product.id ? { ...item, quantity: item.quantity + 1 } : item);
      return [...current, { ...product, quantity: 1 }];
    });
    setToast(`${product.title} added to your bag`);
  };

  const changeQuantity = (id, amount) => {
    setCart((current) =>
      current
        .map((item) => item.id === id ? { ...item, quantity: item.quantity + amount } : item)
        .filter((item) => item.quantity > 0)
    );
  };

  const toggleWishlist = (id) => {
    setWishlist((current) => current.includes(id) ? current.filter((item) => item !== id) : [...current, id]);
  };

  const chooseCategory = (id) => {
    setActiveCategory(id);
    setMenuOpen(false);
    document.getElementById("products")?.scrollIntoView({ behavior: "smooth" });
  };

  const subscribe = (event) => {
    event.preventDefault();
    if (!email.trim() || !email.includes("@")) {
      setToast("Please enter a valid email address");
      return;
    }
    setSubscribed(true);
    setEmail("");
  };

  return (
    <div className="min-h-screen bg-[#f7f8fb] text-slate-950 selection:bg-cyan-200">
      <header className="sticky top-0 z-40 border-b border-slate-200/70 bg-white/85 backdrop-blur-xl">
        <div className="mx-auto flex h-20 max-w-7xl items-center gap-4 px-4 sm:px-6 lg:px-8">
          <button className="rounded-xl p-2 hover:bg-slate-100 lg:hidden" onClick={() => setMenuOpen(true)} aria-label="Open menu">
            <Menu className="h-5 w-5" />
          </button>

          <a href="#top" className="shrink-0 text-xl font-black tracking-tight sm:text-2xl">
            NEXUS<span className="text-cyan-500">SHOP</span>
          </a>

          <nav className="hidden items-center gap-7 pl-6 text-sm font-semibold lg:flex">
            <a href="#top" className="transition hover:text-cyan-500">Home</a>
            <a href="#categories" className="transition hover:text-cyan-500">Categories</a>
            <a href="#products" className="transition hover:text-cyan-500">Trending</a>
            <a href="#deal" className="transition hover:text-cyan-500">Deals</a>
          </nav>

          <div className="ml-auto hidden max-w-sm flex-1 items-center rounded-2xl border border-slate-200 bg-slate-50 px-4 md:flex">
            <Search className="h-4 w-4 text-slate-400" />
            <input
              value={query}
              onChange={(event) => setQuery(event.target.value)}
              onFocus={() => document.getElementById("products")?.scrollIntoView({ behavior: "smooth" })}
              className="w-full bg-transparent px-3 py-3 text-sm outline-none placeholder:text-slate-400"
              placeholder="Search products..."
              aria-label="Search products"
            />
          </div>

          <button className="relative rounded-xl p-2.5 transition hover:bg-slate-100" aria-label="Wishlist">
            <Heart className="h-5 w-5" />
            {wishlist.length > 0 && <span className="absolute right-0 top-0 grid h-4 min-w-4 place-items-center rounded-full bg-cyan-500 px-1 text-[10px] font-bold text-white">{wishlist.length}</span>}
          </button>
          <button onClick={() => setCartOpen(true)} className="relative rounded-xl bg-slate-950 p-2.5 text-white transition hover:bg-cyan-500" aria-label="Open shopping bag">
            <ShoppingBag className="h-5 w-5" />
            {cartCount > 0 && <span className="absolute -right-1.5 -top-1.5 grid h-5 min-w-5 place-items-center rounded-full bg-cyan-400 px-1 text-[10px] font-bold text-slate-950">{cartCount}</span>}
          </button>
        </div>
      </header>

      <AnimatePresence>
        {menuOpen && (
          <>
            <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} onClick={() => setMenuOpen(false)} className="fixed inset-0 z-50 bg-slate-950/40 backdrop-blur-sm" />
            <motion.aside initial={{ x: "-100%" }} animate={{ x: 0 }} exit={{ x: "-100%" }} transition={{ type: "spring", damping: 28, stiffness: 260 }} className="fixed inset-y-0 left-0 z-50 w-[86%] max-w-sm bg-white p-6 shadow-2xl">
              <div className="flex items-center justify-between">
                <span className="text-xl font-black">NEXUS<span className="text-cyan-500">SHOP</span></span>
                <button onClick={() => setMenuOpen(false)} className="rounded-xl bg-slate-100 p-2"><X className="h-5 w-5" /></button>
              </div>
              <div className="mt-8 flex items-center rounded-2xl bg-slate-100 px-4">
                <Search className="h-4 w-4 text-slate-400" />
                <input value={query} onChange={(e) => setQuery(e.target.value)} className="w-full bg-transparent px-3 py-3 outline-none" placeholder="Search products" />
              </div>
              <nav className="mt-8 grid gap-2">
                {categories.map(({ id, name, icon: Icon }) => (
                  <button key={id} onClick={() => chooseCategory(id)} className={`flex items-center gap-3 rounded-2xl px-4 py-3 text-left font-semibold ${activeCategory === id ? "bg-slate-950 text-white" : "hover:bg-slate-100"}`}>
                    <Icon className="h-5 w-5" /> {name}
                  </button>
                ))}
              </nav>
            </motion.aside>
          </>
        )}
      </AnimatePresence>

      <main id="top">
        <section className="mx-auto max-w-7xl px-4 pt-5 sm:px-6 lg:px-8 lg:pt-8">
          <div className="relative min-h-[660px] overflow-hidden rounded-[2rem] bg-slate-950 text-white shadow-2xl shadow-slate-300/60 lg:min-h-[620px]">
            <img src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?auto=format&fit=crop&w=1800&q=90" alt="Modern fashion store interior" className="absolute inset-0 h-full w-full object-cover opacity-50" />
            <div className="absolute inset-0 bg-gradient-to-r from-slate-950 via-slate-950/80 to-slate-900/10" />
            <div className="relative z-10 flex min-h-[660px] max-w-3xl flex-col justify-center px-6 py-20 sm:px-12 lg:min-h-[620px] lg:px-20">
              <motion.div initial={{ opacity: 0, y: 18 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.55 }}>
                <Badge><Sparkles className="mr-1.5 h-3.5 w-3.5 text-cyan-500" /> New season, new essentials</Badge>
                <h1 className="mt-7 max-w-3xl text-5xl font-black leading-[0.98] tracking-[-0.045em] sm:text-6xl lg:text-7xl">
                  Everyday icons, <span className="text-cyan-400">beautifully curated.</span>
                </h1>
                <p className="mt-6 max-w-xl text-base leading-7 text-slate-200 sm:text-lg">
                  Discover standout technology, fashion, and accessories selected for quality, function, and timeless style.
                </p>
                <div className="mt-9 flex flex-wrap gap-3">
                  <Button onClick={() => document.getElementById("products")?.scrollIntoView({ behavior: "smooth" })} className="h-13 rounded-full bg-cyan-400 px-7 font-bold text-slate-950 hover:bg-cyan-300">
                    Shop collection <ArrowRight className="ml-2 h-4 w-4" />
                  </Button>
                  <Button variant="outline" onClick={() => document.getElementById("deal")?.scrollIntoView({ behavior: "smooth" })} className="h-13 rounded-full border-white/30 bg-white/5 px-7 text-white hover:bg-white hover:text-slate-950">
                    Explore deals
                  </Button>
                </div>
              </motion.div>
            </div>
            <div className="absolute bottom-5 left-5 right-5 z-10 grid gap-2 rounded-2xl border border-white/15 bg-white/10 p-3 backdrop-blur-md sm:left-auto sm:right-5 sm:w-[430px] sm:grid-cols-3">
              {[{ icon: Truck, title: "Free delivery", text: "Orders over $80" }, { icon: RotateCcw, title: "Easy returns", text: "Within 30 days" }, { icon: ShieldCheck, title: "Secure pay", text: "Protected checkout" }].map(({ icon: Icon, title, text }) => (
                <div key={title} className="flex items-center gap-3 rounded-xl p-2 sm:block sm:text-center">
                  <Icon className="h-5 w-5 text-cyan-300 sm:mx-auto" />
                  <div><div className="mt-1 text-xs font-bold">{title}</div><div className="text-[10px] text-slate-300">{text}</div></div>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section id="categories" className="mx-auto max-w-7xl px-4 py-20 sm:px-6 lg:px-8">
          <div className="flex flex-col justify-between gap-4 sm:flex-row sm:items-end">
            <div>
              <p className="text-sm font-bold uppercase tracking-[0.2em] text-cyan-600">Browse your way</p>
              <h2 className="mt-3 text-3xl font-black tracking-tight sm:text-4xl">Shop by category</h2>
            </div>
            <p className="max-w-md text-sm leading-6 text-slate-500">Explore modern essentials across our most-loved collections.</p>
          </div>
          <div className="mt-9 grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-7">
            {categories.map(({ id, name, icon: Icon }, index) => (
              <motion.button key={id} whileHover={{ y: -6 }} onClick={() => chooseCategory(id)} className={`group min-h-36 rounded-3xl border p-5 text-left transition ${activeCategory === id ? "border-slate-950 bg-slate-950 text-white shadow-xl" : "border-slate-200 bg-white hover:border-cyan-300 hover:shadow-lg"}`}>
                <span className={`grid h-11 w-11 place-items-center rounded-2xl ${activeCategory === id ? "bg-cyan-400 text-slate-950" : "bg-slate-100 text-slate-700 group-hover:bg-cyan-100"}`}><Icon className="h-5 w-5" /></span>
                <span className="mt-5 block text-sm font-bold leading-tight">{name}</span>
                <span className={`mt-1 block text-[11px] ${activeCategory === id ? "text-slate-400" : "text-slate-400"}`}>{id === "all" ? products.length : products.filter((p) => p.category === id).length} items</span>
              </motion.button>
            ))}
          </div>
        </section>

        <section id="products" className="mx-auto max-w-7xl px-4 pb-20 sm:px-6 lg:px-8">
          <div className="flex flex-col justify-between gap-5 sm:flex-row sm:items-end">
            <div>
              <p className="text-sm font-bold uppercase tracking-[0.2em] text-cyan-600">Customer favorites</p>
              <h2 className="mt-3 text-3xl font-black tracking-tight sm:text-4xl">Trending now</h2>
            </div>
            <div className="flex items-center gap-3">
              <span className="text-sm text-slate-500">{filteredProducts.length} products</span>
              {(activeCategory !== "all" || query) && <button onClick={() => { setActiveCategory("all"); setQuery(""); }} className="rounded-full bg-slate-200 px-4 py-2 text-xs font-bold hover:bg-slate-300">Clear filters</button>}
            </div>
          </div>

          {filteredProducts.length ? (
            <motion.div layout className="mt-9 grid gap-5 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
              <AnimatePresence>
                {filteredProducts.map((product) => (
                  <motion.article layout initial={{ opacity: 0, scale: 0.96 }} animate={{ opacity: 1, scale: 1 }} exit={{ opacity: 0, scale: 0.96 }} key={product.id} className="group overflow-hidden rounded-[1.75rem] border border-slate-200 bg-white shadow-sm transition hover:-translate-y-1 hover:shadow-xl hover:shadow-slate-200/70">
                    <div className={`relative aspect-[4/4.2] overflow-hidden bg-gradient-to-br ${product.accent}`}>
                      <img src={product.image} alt={product.title} className="h-full w-full object-cover transition duration-700 group-hover:scale-105" />
                      <div className="absolute left-4 top-4"><Badge dark={product.badge.includes("-")}>{product.badge}</Badge></div>
                      <button onClick={() => toggleWishlist(product.id)} className={`absolute right-4 top-4 grid h-10 w-10 place-items-center rounded-full shadow-sm backdrop-blur transition ${wishlist.includes(product.id) ? "bg-rose-500 text-white" : "bg-white/90 text-slate-900 hover:bg-rose-50 hover:text-rose-500"}`} aria-label="Toggle wishlist">
                        <Heart className={`h-4 w-4 ${wishlist.includes(product.id) ? "fill-current" : ""}`} />
                      </button>
                    </div>
                    <div className="p-5">
                      <p className="text-xs font-bold uppercase tracking-widest text-slate-400">{product.category}</p>
                      <h3 className="mt-2 text-base font-bold">{product.title}</h3>
                      <div className="mt-3 flex items-center gap-1.5 text-sm">
                        <Star className="h-4 w-4 fill-amber-400 text-amber-400" />
                        <span className="font-bold">{product.rating}</span>
                        <span className="text-slate-400">({product.reviews})</span>
                      </div>
                      <div className="mt-5 flex items-center justify-between gap-3">
                        <div>
                          <span className="text-xl font-black">{money(product.price)}</span>
                          {product.oldPrice && <span className="ml-2 text-xs text-slate-400 line-through">{money(product.oldPrice)}</span>}
                        </div>
                        <button onClick={() => addToCart(product)} className="grid h-11 w-11 shrink-0 place-items-center rounded-full bg-slate-950 text-white transition hover:rotate-6 hover:bg-cyan-500" aria-label={`Add ${product.title} to bag`}>
                          <Plus className="h-5 w-5" />
                        </button>
                      </div>
                    </div>
                  </motion.article>
                ))}
              </AnimatePresence>
            </motion.div>
          ) : (
            <div className="mt-9 rounded-[2rem] border border-dashed border-slate-300 bg-white p-16 text-center">
              <Search className="mx-auto h-10 w-10 text-slate-300" />
              <h3 className="mt-4 text-xl font-bold">No products found</h3>
              <p className="mt-2 text-slate-500">Try another keyword or category.</p>
            </div>
          )}
        </section>

        <section id="deal" className="mx-auto max-w-7xl px-4 pb-20 sm:px-6 lg:px-8">
          <div className="grid overflow-hidden rounded-[2rem] bg-[#092d35] text-white shadow-2xl lg:grid-cols-[1.05fr_.95fr]">
            <div className="relative min-h-[380px] overflow-hidden lg:min-h-[520px]">
              <img src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=1200&q=90" alt="Laptop flash deal" className="absolute inset-0 h-full w-full object-cover" />
              <div className="absolute inset-0 bg-gradient-to-t from-slate-950/50 to-transparent" />
              <div className="absolute bottom-6 left-6"><Badge>Only 12 remaining</Badge></div>
            </div>
            <div className="flex flex-col justify-center p-7 sm:p-12 lg:p-16">
              <p className="text-sm font-bold uppercase tracking-[0.2em] text-cyan-300">Flash sale</p>
              <h2 className="mt-4 text-4xl font-black tracking-tight sm:text-5xl">MacBook Air M2</h2>
              <p className="mt-4 max-w-lg leading-7 text-slate-300">A lightweight powerhouse for creative work, focus, and everything in between.</p>
              <div className="mt-7 flex items-end gap-3"><span className="text-4xl font-black">$999</span><span className="pb-1 text-lg text-slate-400 line-through">$1,199</span><Badge>-17%</Badge></div>
              <div className="mt-8 grid grid-cols-4 gap-2 sm:gap-3">
                {[["Days", countdown.days], ["Hours", countdown.hours], ["Minutes", countdown.minutes], ["Seconds", countdown.seconds]].map(([label, value]) => (
                  <div key={label} className="rounded-2xl border border-white/10 bg-white/5 px-2 py-4 text-center backdrop-blur">
                    <div className="text-xl font-black sm:text-2xl">{String(value).padStart(2, "0")}</div>
                    <div className="mt-1 text-[9px] uppercase tracking-wider text-slate-400 sm:text-[10px]">{label}</div>
                  </div>
                ))}
              </div>
              <Button onClick={() => addToCart({ ...products[1], id: 10, title: "MacBook Air M2", price: 999 })} className="mt-8 h-13 w-full rounded-full bg-cyan-400 font-bold text-slate-950 hover:bg-cyan-300 sm:w-fit sm:px-8">
                Add deal to bag <ArrowRight className="ml-2 h-4 w-4" />
              </Button>
            </div>
          </div>
        </section>

        <section className="mx-auto max-w-7xl px-4 pb-20 sm:px-6 lg:px-8">
          <div className="text-center">
            <p className="text-sm font-bold uppercase tracking-[0.2em] text-cyan-600">Loved by shoppers</p>
            <h2 className="mt-3 text-3xl font-black tracking-tight sm:text-4xl">Real stories, real style</h2>
          </div>
          <div className="mt-9 grid gap-5 md:grid-cols-3">
            {testimonials.map((item) => (
              <Card key={item.name} className="rounded-[1.75rem] border-slate-200 shadow-sm">
                <CardContent className="p-7">
                  <div className="flex gap-1">{Array.from({ length: 5 }).map((_, index) => <Star key={index} className="h-4 w-4 fill-amber-400 text-amber-400" />)}</div>
                  <p className="mt-5 leading-7 text-slate-600">“{item.quote}”</p>
                  <div className="mt-7 flex items-center gap-3">
                    <img src={item.avatar} alt={item.name} className="h-11 w-11 rounded-full object-cover" />
                    <div><div className="text-sm font-bold">{item.name}</div><div className="text-xs text-slate-400">{item.role}</div></div>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </section>

        <section className="mx-auto max-w-7xl px-4 pb-8 sm:px-6 lg:px-8">
          <div className="relative overflow-hidden rounded-[2rem] bg-cyan-400 px-6 py-14 text-center sm:px-12 sm:py-16">
            <div className="absolute -left-16 -top-24 h-56 w-56 rounded-full bg-white/30 blur-2xl" />
            <div className="absolute -bottom-24 -right-16 h-56 w-56 rounded-full bg-sky-500/30 blur-2xl" />
            <div className="relative mx-auto max-w-2xl">
              {subscribed ? (
                <motion.div initial={{ scale: 0.9, opacity: 0 }} animate={{ scale: 1, opacity: 1 }}>
                  <span className="mx-auto grid h-14 w-14 place-items-center rounded-full bg-slate-950 text-white"><Check className="h-6 w-6" /></span>
                  <h2 className="mt-5 text-3xl font-black">You’re on the list.</h2>
                  <p className="mt-3 text-slate-700">Watch your inbox for new arrivals and members-only offers.</p>
                </motion.div>
              ) : (
                <>
                  <h2 className="text-3xl font-black tracking-tight sm:text-4xl">Style updates, minus the noise.</h2>
                  <p className="mx-auto mt-3 max-w-lg text-slate-700">Be first to discover fresh drops, special prices, and curated weekly picks.</p>
                  <form onSubmit={subscribe} className="mx-auto mt-7 flex max-w-lg flex-col gap-3 rounded-3xl bg-white p-2 sm:flex-row sm:rounded-full">
                    <input value={email} onChange={(e) => setEmail(e.target.value)} type="email" className="min-w-0 flex-1 bg-transparent px-5 py-3 text-sm outline-none" placeholder="Enter your email address" aria-label="Email address" />
                    <Button type="submit" className="h-12 rounded-full bg-slate-950 px-7 font-bold text-white hover:bg-slate-800">Subscribe</Button>
                  </form>
                </>
              )}
            </div>
          </div>
        </section>
      </main>

      <footer className="mt-12 border-t border-slate-200 bg-white">
        <div className="mx-auto grid max-w-7xl gap-10 px-4 py-12 sm:px-6 md:grid-cols-2 lg:grid-cols-4 lg:px-8">
          <div className="lg:col-span-2">
            <div className="text-xl font-black">NEXUS<span className="text-cyan-500">SHOP</span></div>
            <p className="mt-4 max-w-sm text-sm leading-6 text-slate-500">Modern essentials for how you live, work, move, and create.</p>
          </div>
          {[{ title: "Shop", links: ["New arrivals", "Best sellers", "Offers", "Gift cards"] }, { title: "Support", links: ["Help center", "Shipping", "Returns", "Contact"] }].map((group) => (
            <div key={group.title}>
              <h3 className="text-sm font-bold">{group.title}</h3>
              <div className="mt-4 grid gap-3 text-sm text-slate-500">{group.links.map((link) => <a href="#top" key={link} className="hover:text-cyan-600">{link}</a>)}</div>
            </div>
          ))}
        </div>
        <div className="border-t border-slate-100 py-6 text-center text-xs text-slate-400">© {new Date().getFullYear()} NexusShop. Demo storefront.</div>
      </footer>

      <AnimatePresence>
        {cartOpen && (
          <>
            <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} onClick={() => setCartOpen(false)} className="fixed inset-0 z-50 bg-slate-950/45 backdrop-blur-sm" />
            <motion.aside initial={{ x: "100%" }} animate={{ x: 0 }} exit={{ x: "100%" }} transition={{ type: "spring", damping: 28, stiffness: 260 }} className="fixed inset-y-0 right-0 z-50 flex w-full max-w-md flex-col bg-white shadow-2xl">
              <div className="flex items-center justify-between border-b border-slate-100 p-6">
                <div><h2 className="text-xl font-black">Your bag</h2><p className="text-xs text-slate-400">{cartCount} {cartCount === 1 ? "item" : "items"}</p></div>
                <button onClick={() => setCartOpen(false)} className="rounded-xl bg-slate-100 p-2 hover:bg-slate-200"><X className="h-5 w-5" /></button>
              </div>
              <div className="flex-1 overflow-y-auto p-6">
                {cart.length === 0 ? (
                  <div className="grid h-full place-items-center text-center">
                    <div><span className="mx-auto grid h-16 w-16 place-items-center rounded-full bg-slate-100"><ShoppingBag className="h-7 w-7 text-slate-400" /></span><h3 className="mt-5 text-lg font-bold">Your bag is empty</h3><p className="mt-2 text-sm text-slate-400">Add something you love.</p><Button onClick={() => setCartOpen(false)} className="mt-6 rounded-full bg-slate-950 px-6">Continue shopping</Button></div>
                  </div>
                ) : (
                  <div className="grid gap-5">
                    {cart.map((item) => (
                      <div key={item.id} className="flex gap-4 rounded-2xl border border-slate-100 p-3">
                        <img src={item.image} alt={item.title} className="h-24 w-20 rounded-xl object-cover" />
                        <div className="min-w-0 flex-1">
                          <div className="flex justify-between gap-2"><h3 className="truncate text-sm font-bold">{item.title}</h3><button onClick={() => setCart((current) => current.filter((product) => product.id !== item.id))} className="text-slate-400 hover:text-rose-500"><Trash2 className="h-4 w-4" /></button></div>
                          <div className="mt-1 text-sm font-black">{money(item.price)}</div>
                          <div className="mt-3 flex w-fit items-center rounded-full bg-slate-100 p-1">
                            <button onClick={() => changeQuantity(item.id, -1)} className="grid h-7 w-7 place-items-center rounded-full hover:bg-white"><Minus className="h-3 w-3" /></button>
                            <span className="w-8 text-center text-xs font-bold">{item.quantity}</span>
                            <button onClick={() => changeQuantity(item.id, 1)} className="grid h-7 w-7 place-items-center rounded-full hover:bg-white"><Plus className="h-3 w-3" /></button>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
              {cart.length > 0 && (
                <div className="border-t border-slate-100 p-6">
                  <div className="flex items-center justify-between"><span className="text-sm text-slate-500">Subtotal</span><span className="text-2xl font-black">{money(subtotal)}</span></div>
                  <p className="mt-2 text-xs text-slate-400">Shipping and taxes calculated at checkout.</p>
                  <Button onClick={() => setToast("Checkout is ready for backend integration")} className="mt-5 h-13 w-full rounded-full bg-slate-950 font-bold hover:bg-cyan-500">Checkout <ChevronRight className="ml-2 h-4 w-4" /></Button>
                </div>
              )}
            </motion.aside>
          </>
        )}
      </AnimatePresence>

      <AnimatePresence>
        {toast && (
          <motion.div initial={{ opacity: 0, y: 30, scale: 0.95 }} animate={{ opacity: 1, y: 0, scale: 1 }} exit={{ opacity: 0, y: 20 }} className="fixed bottom-5 left-1/2 z-[70] flex -translate-x-1/2 items-center gap-2 whitespace-nowrap rounded-full bg-slate-950 px-5 py-3 text-sm font-semibold text-white shadow-2xl">
            <Check className="h-4 w-4 text-cyan-400" /> {toast}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
