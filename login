import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import PrimaryButton from '../../common/components/PrimaryButton';
import FormInput from '../../common/components/FormInput';
import './login.css';
import logo from './sc-logo.png'; 

const userAccess = {
  maker: {
    password: 'maker123',
    pages: [
      { name: 'Payroll Payment', path: '/payroll' },
      { name: 'Manage Payroll', path: '/manage-payroll' },
      { name: 'Transactions', path: '/txns' },
    ],
  },
  checker: {
    password: 'checker123',
    pages: [
      { name: 'Approvals', path: '/approvals' },
      { name: 'Account Balance', path: '/balances' },
      { name: 'Transactions', path: '/txns' },
    ],
  },
  auditor: {
    password: 'audit123',
    pages: [
      { name: 'Print Preview', path: '/print' },
      { name: 'Transactions', path: '/txns' },
    ],
  },
};

export default function Login() {
  const [username, setUsername] = useState('');
  const [pwd, setPwd] = useState('');
  const [error, seterror] = useState('');
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    const enteredUser=username.trim().toLowerCase();
    const user = userAccess[enteredUser];

    if (user && user.password === pwd) {
      localStorage.setItem("allowedPages", JSON.stringify(user.pages));
      navigate('/dashboard');
    } else {
      seterror("Invalid username or password");
    }
  };

  return (
    <div className="login-page">
      {/* HEADER */}
      <header className="header">
        
        <a href="https://www.sc.com/en/contact-us/" className="contact-link">Contact Us</a>
      </header>

      {/* MAIN CONTENT */}
      <div className="main-content">
        <div className="login-text">
            <h1>Welcome to Payment Initiation</h1>
             <h2><p>Standard Chartered's digital banking platform for global business clients</p></h2>
        </div>

        {/* Existing login card */}
        <div className="login-card">
        <center><img src={logo} alt="Standard Chartered Logo" className="logo" /></center>
          <h3>Log In</h3>
          
          <div className="first-time-user">
            
          </div>

          {error && <div className="alert alert-danger">{error}</div>}
          <form onSubmit={handleSubmit}>
            <FormInput
              type="text"
              label="User ID"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
            
            />
            <FormInput
              label="Password"
              type="password"
              value={pwd}
              onChange={(e) => setPwd(e.target.value)}
            
            />
            <div className="options">
              
            
            </div>
            <PrimaryButton type="submit">Sign In</PrimaryButton>
          </form>
        </div>
      </div>
      
      {/* FOOTER */}
      <footer className="footer">
        © 2025 Standard Chartered. All rights reserved.
      </footer>
    </div>
  );
}






import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import PrimaryButton from '../../common/components/PrimaryButton';
import FormInput from '../../common/components/FormInput';
import './login.css';
import logo from './sc-logo.png'; 

const userAccess = {
  maker: {
    password: 'maker123',
    role: 'Maker',
    pages: [
      { name: 'Payroll Payment', path: '/payroll' },
      { name: 'Manage Payroll', path: '/manage-payroll' },
      { name: 'Transactions', path: '/txns' },
    ],
  },
  checker: {
    password: 'checker123',
    role: 'Checker',
    pages: [
      { name: 'Approvals', path: '/approvals' },
      { name: 'Account Balance', path: '/balances' },
      { name: 'Transactions', path: '/txns' },
    ],
  },
  auditor: {
    password: 'audit123',
    role: 'Auditor',
    pages: [
      { name: 'Print Preview', path: '/print' },
      { name: 'Transactions', path: '/txns' },
    ],
  },
};

export default function Login() {
  const [username, setUsername] = useState('');
  const [pwd, setPwd] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    const enteredUser = username.trim().toLowerCase();
    const user = userAccess[enteredUser];

    if (user && user.password === pwd) {
      const userInfo = {
        username: enteredUser,
        role: user.role,
        loginTime: new Date().toISOString(),
      };

      // Save everything in localStorage
      localStorage.setItem("allowedPages", JSON.stringify(user.pages));
      localStorage.setItem("currentUser", JSON.stringify(userInfo));

      navigate('/dashboard');
    } else {
      setError("Invalid username or password");
    }
  };

  return (
    <div className="login-page">
      {/* HEADER */}
      <header className="header">
        <a href="https://www.sc.com/en/contact-us/" className="contact-link">Contact Us</a>
      </header>

      {/* MAIN CONTENT */}
      <div className="main-content">
        <div className="login-text">
          <h1>Welcome to Payment Initiation</h1>
          <h2>
            <p>Standard Chartered's digital banking platform for global business clients</p>
          </h2>
        </div>

        <div className="login-card">
          <center>
            <img src={logo} alt="Standard Chartered Logo" className="logo" />
          </center>
          <h3>Log In</h3>

          {error && <div className="alert alert-danger">{error}</div>}
          <form onSubmit={handleSubmit}>
            <FormInput
              type="text"
              label="User ID"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
            />
            <FormInput
              label="Password"
              type="password"
              value={pwd}
              onChange={(e) => setPwd(e.target.value)}
            />
            <PrimaryButton type="submit">Sign In</PrimaryButton>
          </form>
        </div>
      </div>

      {/* FOOTER */}
      <footer className="footer">
        © 2025 Standard Chartered. All rights reserved.
      </footer>
    </div>
  );
}





import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import PrimaryButton from '../../common/components/PrimaryButton';
import FormInput from '../../common/components/FormInput';
import './login.css';
import logo from './sc-logo.png'; 

const userAccess = {
  maker: {
    password: 'maker123',
    pages: [
      { name: 'Payroll Payment', path: '/payroll' },
      { name: 'Manage Payroll', path: '/manage-payroll' },
      { name: 'Transactions', path: '/txns' },
    ],
  },
  checker: {
    password: 'checker123',
    pages: [
      { name: 'Approvals', path: '/approvals' },
      { name: 'Account Balance', path: '/balances' },
      { name: 'Transactions', path: '/txns' },
    ],
  },
  auditor: {
    password: 'audit123',
    pages: [
      { name: 'Print Preview', path: '/print' },
      { name: 'Transactions', path: '/txns' },
    ],
  },
};

export default function Login() {
  const [username, setUsername] = useState('');
  const [pwd, setPwd] = useState('');
  const [error, seterror] = useState('');
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    const enteredUser=username.trim().toLowerCase();
    const user = userAccess[enteredUser];

    if (user && user.password === pwd) {
      localStorage.setItem("allowedPages", JSON.stringify(user.pages));
      localStorage.setItem("currentUser", JSON.stringify(enteredUser));
      localStorage.setItem("lastLogin", new Date().toLocaleString());
      navigate('/dashboard');
    } else {
      seterror("Invalid username or password");
    }
  };

  return (
    <div className="login-page">
      <header className="header">
        <a href="https://www.sc.com/en/contact-us/" className="contact-link">Contact Us</a>
      </header>

      <div className="main-content">
        <div className="login-text">
            <h1>Welcome to Payment Initiation</h1>
             <h2><p>Standard Chartered's digital banking platform for global business clients</p></h2>
        </div>

        <div className="login-card">
        <center><img src={logo} alt="Standard Chartered Logo" className="logo" /></center>
          <h3>Log In</h3>

          {error && <div className="alert alert-danger">{error}</div>}
          <form onSubmit={handleSubmit}>
            <FormInput
              type="text"
              label="User ID"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
            />
            <FormInput
              label="Password"
              type="password"
              value={pwd}
              onChange={(e) => setPwd(e.target.value)}
            />
            <PrimaryButton type="submit">Sign In</PrimaryButton>
          </form>
        </div>
      </div>
      
      <footer className="footer">
        © 2025 Standard Chartered. All rights reserved.
      </footer>
    </div>
  );
}
