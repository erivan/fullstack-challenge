import { FETCH_COVER } from '../actions/index';

export default function(state = [], action) {
  switch(action.type) {
    case FETCH_COVER:
      return action.payload.data;
    default: return state;
  }
}