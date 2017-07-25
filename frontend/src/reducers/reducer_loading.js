import { LOADING_START, LOADING_END } from '../actions/index';

export default function(state = null, action) {
  switch(action.type) {
    case LOADING_START:
      return true;
    case LOADING_END:
      return false;
    default:
      return state;
  }
}