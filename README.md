# 📊 **Personal Expense Tracker** 💰

The **Personal Expense Tracker** project is a PL/SQL-based solution designed to help individuals monitor and manage their monthly expenses effectively. 🚀

## 🌟 Features:
- 📅 **Set Monthly Budget:** Define a budget for each month to keep your finances in check.
- 💸 **Track Expenses by Category:** Easily categorize and track your spending.
- ⚠️ **Automatic Alerts:** Receive automatic alerts when you exceed your budget!  
- 🗂️ **Expense and Budget Tables:** 
  - `Expense` 🧾: Stores individual expense details like category, amount, date, and description.
  - `Budget` 💵: Stores the maximum budget for each month.
- 🔢 **Expense Sequence:** A sequence (`Expense_seq`) generates unique IDs for each expense entry.

## ⚙️ **Core Functionality:**
- **PL/SQL Triggers**: The `BudgetAlert` trigger automatically checks if the total expenses for the month surpass the set budget limit. If the expenses exceed the budget, a warning message is displayed in the DBMS output. 🚨
  
## 🖥️ **SQL Queries**:
- Insert new expenses 🏷️
- View total spending 🧮
- Categorize expenses by type 📊

## 💡 **Ideal For**:
- 📈 Individuals looking to track their personal finances in a simple and organized manner.
- 🔔 Those who want real-time budget alerts to stay on top of their spending!

---

### 🏁 **Conclusion**:
The **Personal Expense Tracker** is an efficient, automated, and easy-to-use tool for managing your personal finances. With built-in alerts, you’ll always be aware of your spending! 💡
