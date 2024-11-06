import React from 'react';
import './App.css';
import { useEffect } from 'react';


function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Welcome to Our Online Store</h1>
      </header>
      <main>
        <section className="products">
          <h2>Products</h2>
          <ul>
            <li>
              <h3>Product 1</h3>
              <p>Description of Product 1</p>
              <button onClick={() => alert('Product 1 clicked')}>Buy Product 1</button>
            </li>
            <li>
              <h3>Product 2</h3>
              <p>Description of Product 2</p>
              <button onClick={() => alert('Product 2 clicked')}>Buy Product 2</button>
            </li>
            <li>
              <h3>Product 3</h3>
              <p>Description of Product 3</p>
              <button onClick={() => alert('Product 3 clicked')}>Buy Product 3</button>
            </li>
          </ul>
        </section>
      </main>
    </div>
  );
  
}

export default App;
