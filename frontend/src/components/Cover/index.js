import React, { Component } from 'react';
import ComicDetail from '../ComicDetail/ComicDetail.js'
import './Cover.css';
import _ from 'lodash';

class Cover extends Component {
    constructor(props) {
      super(props);
      this.state = { image_size: this.imageSize(window.innerWidth), mouseOver: false, comicClick: false, comic: null }
    }

    static propTypes = {
      comicData: React.PropTypes.object.isRequired,
      comic: React.PropTypes.object,
      upVote: React.PropTypes.func.isRequired,
      upVoted: React.PropTypes.bool.isRequired
    }

    handleResize() {
      this.setState({ image_size: this.imageSize(window.innerWidth) });
    }

    componentDidMount() {
      window.addEventListener('resize', this.handleResize.bind(this));
    }

    componentWillUnmount() {
      window.removeEventListener('resize', this.handleResize.bind(this));
    }

    imageSize(width) {
      return (width < 768) ? 'portrait_uncanny' : 'portrait_fantastic' ;
    }

    showDetails(show) {
      this.setState({ mouseOver: show })
    }

    coverDate() {
      const date = _.find(this.props.comicData.dates, ['type', 'onsaleDate']);
      return new Date(date.date).getFullYear();
    }

    coverUpvoted() {
      if(!this.props.upVoted) { return null; }

      return (<div className="cover-upvoted">
          <div className="cover-heart-on"></div>
        </div>)
    }

    renderDetail() {
      if (!this.state.mouseOver) { return null; }

      return (
        <div className="cover-detail">
          <div className="cover-heart" onClick={ this.props.upVote.bind(this) }></div>
          <div className="cover-footer">
            <div className="cover-title">
              { this.props.comicData.title }
            </div>
            <div>
              <span className="cover-issue"># { this.props.comicData.issueNumber }</span>
              <span className="cover-year">{ this.coverDate.call(this) }</span>
            </div>
          </div>
        </div>
        );
    }

    coverImage() {
      return `${this.props.comicData.thumbnail.path}/${this.state.image_size}.${this.props.comicData.thumbnail.extension}`;
    }
    showComicDetail(show) {
      if(show) {
        this.showDetails(false);
      }
      this.setState({ comicClick: show })
    }
    renderComicDetail() {
      if (this.state.comicClick){
        return <ComicDetail comicName="Despacito" comicId={this.props.comicData.id} />
        }

      return null;
    }
    removeShowingDetail() {
      // this.showComicDetail(false);
      this.showDetails(false);
    }

    render() {
      return (
        <div className="pure-u-23-24 pure-u-md-1-4 pure-u-lg-1-5"
          onClick={ this.showComicDetail.bind(this, !this.state.comicClick ) }
          onMouseEnter={ this.showDetails.bind(this, true) }
          onMouseLeave={ this.removeShowingDetail.bind(this) }>

            { this.renderComicDetail() }
          <div className="cover">
            <img className="cover-image" alt={ this.props.comicData.title } src={ this.coverImage.call(this) } />
            { this.renderDetail() }
            { this.coverUpvoted() }
          </div>

        </div>
      );
    }
}



export default Cover;
