import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import HomePage from './components/HomePage';
import GodDetail from './components/GodDetail';
import 'bootstrap/dist/css/bootstrap.min.css';

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/hindu_gods" element={<HomePage />} />
        <Route path="/hindu_gods/:id" element={<GodDetail />} />
        <Route path="*" element={<HomePage />} />
      </Routes>
    </Router>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  const rootElement = document.getElementById('bx-block-god-app');
  if (rootElement) {
    const root = ReactDOM.createRoot(rootElement);
    root.render(<App />);
  }
}); 