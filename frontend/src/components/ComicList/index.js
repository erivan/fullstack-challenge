import React, { Component } from 'react';
import { connect } from 'react-redux';
import { actions } from '../../actions/index.js';
import Cover from '../Cover/index.js';
import './ComicList.css';

class ComicList extends Component {

  constructor(props) {
    super(props);
    this.state = { page: 0, upvoted: [] };
  }

  componentWillMount() {
    this.fetchComics(null, this.state.page);
    this.props.fetchUpVotes();
  }

  componentWillUpdate(nextProps, nextState) {
    if (this.state.page !== nextState.page || nextProps.search_term !== this.props.search_term) {
      this.fetchComics(nextProps.search_term, nextState.page);
    }
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.up_votes !== this.props.up_votes) {
      this.setState({ upvoted: nextProps.up_votes });
    }
  }

  fetchComics(term, page) {
    this.props.fetchComics(term, page);
  }

  nextPage() {
    this.setState(function(previousState, currentProps) {
      return { page: previousState.page + 1};
    });
  }

  previousPage() {
    this.setState(function(previousState, currentProps) {
      return { page: Math.max(0, previousState.page - 1) };
    });
  }

  checkUpvoted(comic_id) {
    return this.state.upvoted.indexOf(comic_id) > -1
  }

  upvote(comic_id) {
    this.props.upVote(comic_id);
    this.setState({ upvoted: [comic_id, ...this.state.upvoted] });
  }

  renderList()  {
    const results = this.props.comics;
    return results.map((comic) => {
      return (
        <Cover
          key={comic.id}
          upVote={ this.upvote.bind(this, comic.id) }
          upVoted={ this.checkUpvoted.call(this, comic.id) }
          comicData={ comic }
        />)
    });
  }

  renderMessageForEmptyList() {
    if (this.props.comics.length > 0 || this.props.search_term === null) return null;

    return (
      <div className="empty-message">
        Sorry, we didn't find Covers, matching your search
      </div>)
  }

  renderPagination() {
    if (this.props.comics.length === 0) return null;

    return (
      <div className="pagination">
        <div className="pull-left">
          <span className="page-button" onClick={ this.previousPage.bind(this) }>previous page</span>
        </div>
        <div className="pull-right">
          <span className="page-button" onClick={ this.nextPage.bind(this) } >next page</span>
        </div>
      </div>
    )
  }

  render() {
    return (
      <div>
        <div className="comic-list">
          <div className="pure-g">
            { this.renderList() }
          </div>
          { this.renderPagination() }
        </div>
        { this.renderMessageForEmptyList() }
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    comics: state.comics,
    search_term: state.search_term,
    up_votes: state.up_votes
  };
 }

export default connect(mapStateToProps, actions)(ComicList)