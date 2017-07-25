import axios from 'axios';

const ROOT_URL = '';

export const FETCH_COVER   = 'FETCH_COVER';
export const SEARCH_COMIC  = 'SEARCH_COMIC';
export const LOADING_START = 'LOADING_START';
export const LOADING_END   = 'LOADING_END';
export const UPVOTE        = 'UPVOTE';
export const FETCH_UPVOTES  = 'FETCH_UPVOTES';

export const actions = {
  fetchComics(term, page) {
    let url = `${ROOT_URL}/api/comics?page=${page}`;
    if(term && term !== '') { url += `&title=${term}` }

    return dispatch => {
      dispatch({type: LOADING_START });
      axios.get(url)
        .then(response => {
          dispatch({type: LOADING_END })
          dispatch({type: FETCH_COVER, payload: response});
        })
    }
  },

  upVote(comic_id) {
    const url = `${ROOT_URL}/api/comics/${comic_id}/upvote`;

    return dispatch => {
      dispatch({type: LOADING_START });
      axios.put(url)
        .then(response => {
          dispatch({type: LOADING_END });
          dispatch({type: UPVOTE, payload: response});
        })
    }
  },

  fetchUpVotes() {
    const url = `${ROOT_URL}/api/comics/upvotes`;

    return dispatch => {
      dispatch({type: LOADING_START });
      axios.get(url)
        .then(response => {
          dispatch({type: LOADING_END });
          dispatch({type: FETCH_UPVOTES, payload: response});
        })
    }
  },

  searchComics(term) {
    return {
      type: SEARCH_COMIC,
      term: term
    };
  }
}