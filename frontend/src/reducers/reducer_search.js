import { SEARCH_COMIC } from '../actions/index';

export default function(state = null, action) {
  switch(action.type) {
    case SEARCH_COMIC:
      return action.term;
    default:
      return state;
  }
}