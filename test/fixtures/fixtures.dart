import 'data_model/fixtures.dart' as data;
import 'domain_model/fixtures.dart' as domain;

void useFixtureDataModel([chosenSet]) {
  data.useFixture(chosenSet);
}

void useFixtureDomainModel([chosenSet]) {
  domain.useFixture(chosenSet);
}
