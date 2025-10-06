# 🛒 Zepto Product Data Analysis (SQL Project)

This project demonstrates end-to-end **data exploration**, **cleaning**, and **analysis** using SQL on Zepto’s product dataset. The dataset contains information about product SKUs, pricing, discounts, weights, and stock availability.  
It aims to uncover business insights such as top-value products, revenue estimates, and inventory patterns.

---

## 📂 Project Structure

| File | Description |
|------|--------------|
| `zepto_v1.xlsx` | Original dataset containing product-level information (SKU, category, price, etc.). |
| `zeptoSQL.sql` | SQL script for creating tables, cleaning data, and performing exploratory and analytical queries. |

---

## 🧠 Objectives

1. **Explore and clean** raw product data.  
2. **Handle null values**, zero pricing, and unit inconsistencies.  
3. **Generate insights** on pricing, discounts, stock, and revenue.  
4. **Classify products** based on weight categories.  

---

## 🏗️ Database Setup

Run the SQL script in your preferred SQL environment (e.g., **PostgreSQL**, **MySQL**, **SQLite**) with minor syntax adjustments if needed.

### Steps:
1. Create a new database, e.g.:
   ```sql
   CREATE DATABASE zepto_data;
   ```
2. Connect to the database and execute the provided script:
   ```bash
   \i zeptoSQL.sql
   ```
3. Verify the table creation:
   ```sql
   \d zepto;
   ```

---

## 📊 Data Overview

**Table Name:** `zepto`  
**Columns:**
| Column | Type | Description |
|---------|------|-------------|
| `sku_id` | SERIAL PRIMARY KEY | Unique product identifier |
| `category` | VARCHAR(120) | Product category |
| `name` | VARCHAR(150) | Product name |
| `mrp` | NUMERIC(8,2) | Maximum Retail Price |
| `discountPercent` | NUMERIC(5,2) | Discount percentage applied |
| `availableQuantity` | INTEGER | Quantity available in stock |
| `discountedSellingPrice` | NUMERIC(8,2) | Selling price after discount |
| `wieghtInGMs` | INTEGER | Product weight in grams |
| `outofstock` | BOOLEAN | Availability status |
| `quantity` | INTEGER | Quantity ordered or referenced |

---

## 🧹 Data Cleaning Performed

- Removed entries with `MRP = 0`.
- Converted prices from **paisa to rupees**.
- Checked for **NULL values** in key columns.
- Identified duplicate product names and out-of-stock items.

---

## 📈 Key Insights & Queries

| Query | Insight |
|--------|----------|
| **Q1:** Top 10 best-value products | Based on highest discount percentages |
| **Q2:** High MRP out-of-stock products | Identifies luxury or premium items unavailable |
| **Q3:** Category-wise revenue estimate | Uses discounted price × quantity |
| **Q4:** High MRP with low discount | Identifies potential overpricing |
| **Q5:** Top 5 categories by average discount | Helps understand discount strategy |
| **Q6:** Price per gram analysis | Determines best value per weight |
| **Q7:** Product categorization by weight | Groups items into Low, Medium, Bulk |
| **Q8:** Total inventory weight per category | Shows stock volume distribution |

---

## 📦 Example Query

```sql
-- Find top 10 best-value products
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;
```

---

## 🧩 Tools Used

- **SQL** (PostgreSQL-compatible)
- **Excel** for initial data inspection (`zepto_v1.xlsx`)
- **VS Code / DBeaver** (recommended for running queries)

---

## 🧾 Author

**Nakul Krishna R**  
📧 nakulkrishna96@gmail.com  


---

## 📜 License

This project is released under the [MIT License](licence.txt).

---

### ⭐ If you found this project useful, please star the repository!
