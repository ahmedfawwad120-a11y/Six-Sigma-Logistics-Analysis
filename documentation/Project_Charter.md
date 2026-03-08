# Project Charter: Olist Delivery Optimization

## Problem Statement
Analysis of 96,470 delivered orders reveals an **8.11% defect rate** (Late Deliveries), representing a **DPMO (Defects Per Million Opportunities) of 81,124**. This equates to a **2.9 Sigma level**, well below the industry standard of 4.0+. Late deliveries are directly impacting CSAT and brand loyalty.

## Goals
* Reduce defect rate from 8.11% to < 5.0% within 6 months.
* Improve Process Sigma from 2.9 to 3.2.

## SIPOC Diagram
* **Supplier:** Marketplace Sellers & Loggi/Correios (Carriers).
* **Input:** Customer order details, warehouse inventory.
* **Process:** Order Received → Approved → Shipped → Delivered.
* **Output:** Product received by customer.
* **Customer:** Brazilian e-commerce buyers.

## Critical to Quality (CTQ)
* **Metric:** Lead Time Variance (Actual vs. Estimated Delivery).
* **Specification:** Actual Delivery Date $\le$ Estimated Delivery Date.
