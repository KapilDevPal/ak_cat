import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import HomePage from './components/HomePage';
import GodDetail from './components/GodDetail';

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/hindu_gods" element={<HomePage />} />
        <Route path="/hindu_gods/:id" element={<GodDetail />} />
      </Routes>
    </Router>
  );
};

export default App; 