
-- Create Expense Table
CREATE TABLE Expense (
    ExpenseID NUMBER PRIMARY KEY,
    Category VARCHAR2(30),
    Amount NUMBER(10,2),
    SpentOn DATE,
    Notes VARCHAR2(100)
);

-- Create Budget Table
CREATE TABLE Budget (
    MonthYear VARCHAR2(7) PRIMARY KEY,  -- e.g., '2025-05'
    MaxBudget NUMBER(10,2)
);

-- Insert Monthly Budget
INSERT INTO Budget VALUES ('2025-05', 5000);

-- Sequence for ExpenseID
CREATE SEQUENCE Expense_seq START WITH 1 INCREMENT BY 1;

-- Trigger to Warn if Budget Exceeded
CREATE OR REPLACE TRIGGER BudgetAlert
AFTER INSERT ON Expense
FOR EACH ROW
DECLARE
    v_Total NUMBER;
    v_Budget NUMBER;
    v_MonthYear VARCHAR2(7);
BEGIN
    v_MonthYear := TO_CHAR(:NEW.SpentOn, 'YYYY-MM');
    
    SELECT NVL(SUM(Amount), 0) INTO v_Total 
    FROM Expense 
    WHERE TO_CHAR(SpentOn, 'YYYY-MM') = v_MonthYear;
    
    SELECT MaxBudget INTO v_Budget FROM Budget WHERE MonthYear = v_MonthYear;
    
    IF v_Total > v_Budget THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ Warning: Budget limit exceeded for ' || v_MonthYear);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ No budget set for ' || v_MonthYear);
END;
/

-- Insert Sample Expenses
INSERT INTO Expense VALUES (Expense_seq.NEXTVAL, 'Groceries', 1200, TO_DATE('2025-05-05', 'YYYY-MM-DD'), 'Monthly shopping');
INSERT INTO Expense VALUES (Expense_seq.NEXTVAL, 'Transport', 800, TO_DATE('2025-05-06', 'YYYY-MM-DD'), 'Office cab');
INSERT INTO Expense VALUES (Expense_seq.NEXTVAL, 'Dining', 1500, TO_DATE('2025-05-08', 'YYYY-MM-DD'), 'Dinner out');
INSERT INTO Expense VALUES (Expense_seq.NEXTVAL, 'Books', 1800, TO_DATE('2025-05-10', 'YYYY-MM-DD'), 'Reference books');

-- Query Total Spent in May 2025
SELECT SUM(Amount) AS Total_Spent
FROM Expense
WHERE TO_CHAR(SpentOn, 'YYYY-MM') = '2025-05';

-- Query Category-Wise Spending
SELECT Category, SUM(Amount) AS Total_By_Category
FROM Expense
WHERE TO_CHAR(SpentOn, 'YYYY-MM') = '2025-05'
GROUP BY Category;
