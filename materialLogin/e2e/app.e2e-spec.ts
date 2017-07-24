import { MaterialLoginPage } from './app.po';

describe('material-login App', () => {
  let page: MaterialLoginPage;

  beforeEach(() => {
    page = new MaterialLoginPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
