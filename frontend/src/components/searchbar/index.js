import React, { Component } from 'react';
import { connect } from 'react-redux';
import { actions } from '../../actions/index.js';
import logo from '../../assets/marvel_logo.png';
import './Searchbar.css';

class Searchbar extends Component {

  constructor(props) {
    super(props);
    this.state = { term: '' };
  }

  onFormSubmit(event) {
    event.preventDefault();
    this.props.searchComics(this.state.term);
  }

  onInputChange(event) {
    this.setState({ term: event.target.value })
  }

  render() {
    let loadingLogo = (this.props.loading === true)? "loading-logo" : '';

    return (
      <div className="searchbar">
        <div><img className={loadingLogo} src={ logo } alt="Marvel" /></div>

        <form className="pure-form" onSubmit={ this.onFormSubmit.bind(this) }>
          <fieldset>
            <input
              className="pure-u-1 pure-u-sm-23-24 pure-u-md-3-8"
              placeholder="Search for marvel character or team..."
              onChange={ this.onInputChange.bind(this) } />
          </fieldset>
        </form>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    loading: state.loading
  };
 }

export default connect(mapStateToProps, actions)(Searchbar)