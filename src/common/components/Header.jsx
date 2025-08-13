import React from 'react';
import logo from '../../assets/sc-logo.png';

export default function Header() {
  return (
    <header className="brand-gradient py-2 px-3">
      <div className="d-flex align-items-center justify-content-between container-fluid">
        <div className="d-flex align-items-center">
          <img src={logo} alt="Standard Chartered" className="header-logo" />
          <h1 className="h1 mb-0">Payment Initiations</h1>
        </div>
        <div className="d-flex gap-3 ">
          <span><h2>Help</h2></span>
          <span><h2>Profile</h2></span>
        </div>
      </div>
    </header>
  );
}