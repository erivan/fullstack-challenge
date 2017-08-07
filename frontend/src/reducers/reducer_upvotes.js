import { FETCH_UPVOTES } from '../actions/index';

export default function(state = [], action) {
  switch(action.type) {
    case FETCH_UPVOTES:
      return action.payload.data.map((up_votes) => { return up_votes.comic_id });
    default: return state;
  }
}
