/* @flow weak */


import React, { Component } from 'react';
import { connect } from 'react-redux';
import { actions } from '../../actions/index.js';
import './ComicDetail.css'

class ComicDetail extends Component {

  constructor(props) {
    super(props);
    this.state = {comic: null, image_size: this.imageSize(window.innerWidth) }
  }


  imageSize(width) {
    return (width < 768) ? 'portrait_uncanny' : 'portrait_fantastic' ;
  }
  static propTypes = {
    comicId: React.PropTypes.number.isRequired,
    comic: React.PropTypes.object
  }
  getNames = (items) => {
    return items.map((creator) => {
      return creator.name;
    }).join(', ');
  };
  componentWillMount() {
    this.props.fetchComic(this.props.comicId);
  }
  componentWillReceiveProps(newProps) {
    if(newProps.comic !== this.props.comic && newProps.comic !== this.state.comic){
      this.setState({comic: newProps.comic})
    }
  }
  getSrc = (image) => {
    return `${image.path}/${this.state.image_size}.${image.extension}`;
  }

  comicImages = () => {
    const {title, images } = this.state.comic;
    return images.map((image) => {
      return <div className={this.getImageClass.call(this, images.length)}>
        <img className="pure-img img-detail" alt={ title } src={ this.getSrc.call(this, image)} />
        </div>;
    });
  }
  renderByCast = (cast) => {
    if(cast.length === 0) return null;

    return <span className="pure-u-5-5">
      <span className="group-title"> Creators: </span>
      { this.getNames(cast) }
    </span>
  }
  getImageClass = (imageLength) => {
    if(imageLength === 1) return 'pure-u-1-1 pure-u-lg-1-5';
    return (imageLength > 8 ) ? 'pure-u-1-4 pure-u-lg-1-8' : 'pure-u-1-2 pure-u-lg-1-8' ;
  }
  render(){
    if(this.state.comic === null) {
      return null;
    }
    const { title, creators, characters} = this.state.comic;
    return(
      <div className="comic-detail">
        <div className="pure-g">
          <div className="pure-u-1-4 pure-u-1-1">
            <div className="comic-informations">
              <span className="pure-u-5-5"> { title }</span>
              { this.renderByCast(creators.items) }
              { this.renderByCast(characters.items) }
            </div>
          </div>

          <div className="pure-u-1-4 pure-u-1-1">
                    <div className="images-section">
              {this.comicImages.call(this)}
          </div>

        </div>

        </div>
      </div>
    );
  }
};
function mapStateToProps(state) {
  return {
    comic: state.comic
  };
}
export default connect(mapStateToProps, actions)(ComicDetail);
