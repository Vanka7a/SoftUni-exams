﻿using Microsoft.EntityFrameworkCore;
using P03_SalesDatabase.Data.Models;

namespace P03_SalesDatabase.Data
{
    public class SalesContext : DbContext
    {
        public SalesContext()
        {
        }

        public SalesContext(DbContextOptions<SalesContext> options)
            : base(options)
        {
        }

        public DbSet<Customer> Customers { get; set; }

        public DbSet<Product> Products { get; set; }

        public DbSet<Sale> Sales { get; set; }

        public DbSet<Store> Stores { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(@"Server=.\SQLEXPRESS01; Database=SalesDb; Integrated Security=true");
            }

            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>()
                .Property(p => p.Description)
                .HasDefaultValue("No description");

            modelBuilder.Entity<Sale>()
                .Property(s => s.Date)
                .HasDefaultValueSql("GETDATE()");

            base.OnModelCreating(modelBuilder);
        }
    }
}
