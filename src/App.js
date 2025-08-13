import React from 'react';
import { Routes, Route, NavLink } from 'react-router-dom';
import Header from './common/components/Header';
import Footer from './common/components/Footer';
import Login from './pages/login/Login';
import Dashboard from './pages/dashboard/Dashboard';
import PayrollPayment from './pages/payroll/PayrollPayment';
import ExcelInput from './pages/excel-input/ExcelInput';
import TransactionList from './pages/transaction-list/TransactionList';
import Approval from './pages/approval/Approval';
import AccountBalance from './pages/account-balance/AccountBalance';
import PrintPreview from './pages/print-preview/PrintPreview';

export default function App() {
  const allowedPages = JSON.parse(localStorage.getItem('allowedPages') || '[]');

  return (
    <div className="app d-flex flex-column min-vh-100">
      <Header />
      <div className="container-fluid py-3 flex-grow-1">
        <div className="row">
          <aside className="col-12 col-md-2 mb-3 mb-md-0">
            <nav className="list-group shadow-sm">
              {allowedPages.map(({ name, path }) => (
                <NavLink key={path} to={path} end className={({isActive}) =>
                  'list-group-item list-group-item-action' + (isActive?' active':'')
                }>
                  {name}
                </NavLink>
              ))}
            </nav>
          </aside>
          <main className="col-12 col-md-10">
            <Routes>
              <Route path="/" element={<Login />} />
              <Route path="/dashboard" element={<Dashboard />} />
              <Route path="/payroll" element={<PayrollPayment />} />
              <Route path="/excel" element={<ExcelInput />} />
              <Route path="/txns" element={<TransactionList />} />
              <Route path="/approvals" element={<Approval />} />
              <Route path="/balances" element={<AccountBalance />} />
              <Route path="/print" element={<PrintPreview />} />
            </Routes>
          </main>
        </div>
      </div>
      <Footer />
    </div>
  );
}