import { combineReducers } from 'redux';
import ComicsReducer from './reducer_comics';
import SearchReducer from './reducer_search';
import LoadingReducer from './reducer_loading';
import UpVotesReducer from './reducer_upvotes';
import ComicReducer from './reducer_comic';
const rootReducer = combineReducers({
  comics: ComicsReducer,
  search_term: SearchReducer,
  up_votes: UpVotesReducer,
  loading: LoadingReducer,
  comic: ComicReducer,
});

export default rootReducer;
