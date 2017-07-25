import React, { Component } from 'react';
import './App.css';
import ComicList from './components/ComicList';
import Searchbar from './components/Searchbar';
import Loading from './components/Loading';

class App extends Component {
  render() {
    return (
      <div className="App">
        <Loading />
        <Searchbar />
        <ComicList />
      </div>
    );
  }
}

export default App;
