import { FETCH_COMIC } from '../actions/index';

export default function(state = [], action) {
  switch(action.type) {
    case FETCH_COMIC:
      return action.payload.data;
    default: return state;
  }
}
