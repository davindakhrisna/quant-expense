# Testing Guide for Quant Expense Tracker

## How to Test Different Months/Years

### Method 1: Using the Test Script (Recommended)

Run the test script to easily simulate different months:

```bash
./test-mode.sh
```

This will give you options to test:
- November 2024 (simulate current month)
- December 2024 (next month)
- January 2025 (new year)
- Custom month/year

### Method 2: Manual Environment Variables

Set environment variables before starting the app:

```bash
# Test November 2024
VITE_TEST_MONTH=11 VITE_TEST_YEAR=2024 npm run dev

# Test December 2024
VITE_TEST_MONTH=12 VITE_TEST_YEAR=2024 npm run dev

# Test January 2025
VITE_TEST_MONTH=1 VITE_TEST_YEAR=2025 npm run dev
```

### Method 3: Browser Console Override

1. Open your app in the browser
2. Open Developer Tools (F12)
3. Go to Console tab
4. Run this code:

```javascript
// Override Date to simulate November 2024
const originalDate = Date;
Date = class extends originalDate {
  constructor(...args) {
    if (args.length === 0) {
      super(2024, 10, 1); // Month is 0-indexed, so 10 = November
    } else {
      super(...args);
    }
  }
};

// Refresh the page
location.reload();
```

## What to Test

### 1. Dashboard Features
- ✅ Add expenses for the test month
- ✅ Search functionality
- ✅ Expense summary calculations
- ✅ Monthly income vs expenses

### 2. AI Consultation
- ✅ AI analysis with test month data
- ✅ Markdown formatting in responses
- ✅ Proper spacing and layout

### 3. History Page
- ✅ View expense history
- ✅ Search through history
- ✅ Month/year filtering

### 4. Settings
- ✅ Update monthly income
- ✅ Form validation

### 5. Cross-Month Testing
- ✅ Add expenses in different months
- ✅ Verify data separation by month/year
- ✅ Test history aggregation

## Test Data Suggestions

### November 2024 Test Data
```
Primary Expenses:
- Rent: Rp 2,500,000
- Groceries: Rp 1,200,000
- Utilities: Rp 500,000

Secondary Expenses:
- Gym Membership: Rp 300,000
- Internet: Rp 200,000

Tertiary Expenses:
- Entertainment: Rp 400,000
- Dining Out: Rp 600,000
```

### Monthly Income
```
Rp 8,000,000
```

This will give you a good mix of categories to test the AI analysis and expense tracking features.

## Troubleshooting

If the test mode isn't working:
1. Make sure you're using the latest code
2. Clear browser cache
3. Restart the development server
4. Check browser console for errors
