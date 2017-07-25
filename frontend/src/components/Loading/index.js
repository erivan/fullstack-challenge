import React, { Component } from 'react';
import { connect } from 'react-redux';
import './Loading.css'

export class Loading extends Component {
  render() {
    if (this.props.loading === true) {
      return(<div className="loading">Loading...</div>);
    }
    return null;
  }
}

function mapStateToProps(state) {
  return {
    loading: state.loading
  };
 }

export default connect(mapStateToProps)(Loading)